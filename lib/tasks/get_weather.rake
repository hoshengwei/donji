namespace :get_weather do
  def get_time
    # 資料時間 (避免氣象局網站更新速度太慢抓取三小時前之資料)
    obstime = Time.now - (3*60*60)
    # 取得離現在時間三小時前的年月日時
    @year = (obstime.year.to_i - 1911).to_s
    @month = obstime.month.to_s.rjust(2, '0')
    @day = obstime.day.to_s.rjust(2, '0')
    @time = obstime.hour.to_s.rjust(2, '0')
    @date = @year + @month + @day
  end


  desc "每小時抓取氣象局基本資料(每小時執行)"
  task :hourly => :environment do
    # 所需套件
    require 'rubygems'
    require 'mechanize'
    # require "methods"
    #資料庫所需基本數據
    get_time
    year = @year
    month = @month
    day = @day
    time = @time
    weather_monthly_id = @date.to_i

    # 創造一個Object來置入所要抓取的檔案_hourly
    agent = Mechanize.new

    # 抓取氣象局資料(每日即時天氣)
    url = "http://www.cwb.gov.tw/V7/observe/24real/Data/46730.htm"
    for i in 2..30
      pars = agent.get(url).search("//tr[#{i}]/th").text.split(" ")
      if pars[0] === ("#{month}/#{day}") && pars[1] ===  ("#{time}:00")
        data = agent.get(url).search("//tr[#{i}]/td")
        temp = data[0].text.to_s
        weather = data[2].text.encode "UTF-8"
        wdir = data[3].text.encode "UTF-8"
        wdsd = data[4].text.split(" | ")[0]
        wdlv = data[4].text.split(" | ")[1]
        humd = data[7].text
        pres = data[8].text
        rain = data[9].text
        break
      end
    end

    # 抓取氣象資料(即時海況)
    url = "http://www.cwb.gov.tw/V7/marine/sea_condition/cht/tables/C5W09.html"
    for i in 3..20
      pp = agent.get(url).search("//tr[#{i}]/td")
      pars1 = pp[0].text.split(" ")[0]
      pars2 = pp[1].text
      if pars1 === "#{month}/#{day}" && pars2 === "#{time}:00"
        wave = pp[3].text
        wvdr = pp[4].text.encode "UTF-8"
        wvpr = pp[5].text
        ocean_temp = pp[11].text
        break
      end
    end

    # 把資料放進資料庫
    WeatherDaily.create( weather_monthly_id: weather_monthly_id, year: year, month: month, day: day, time: time, temp: temp, weather: weather, wdir: wdir, wdsd: wdsd, wdlv: wdlv, humd: humd, pres: pres, rain: rain, wave: wave, wvdr: wvdr, wvpr: wvpr, ocean_temp: ocean_temp)
  end

  desc "即時更新運算每日氣象資料(每小時執行)"
  task :calc  => :environment do
    # require "methods"
    # 取得時間
    get_time
    year = @year
    month = @month
    day = @day
    date = @date
    id = date.to_i

    #取得對應的資料
    day_data = WeatherDaily.where("weather_monthly_id = #{date}")
    temp = day_data.average(:temp).round(2)
    humd = day_data.average(:humd).round(2)
    pres = day_data.average(:pres).round(2)
    ocean_temp = day_data.average(:ocean_temp).round(2)
    t_min = day_data.minimum(:temp)
    t_max = day_data.maximum(:temp)
    wave = day_data.minimum(:wave) + " - " + day_data.maximum(:wave)
    wdsd = day_data.minimum(:wdsd) + " - " + day_data.maximum(:wdsd)
    wdlv = day_data.minimum(:wdlv) + " - " + day_data.maximum(:wdlv)
    rain = day_data.maximum(:rain)
    status = "先行運算"
    day_data.where('time = "14"').each do |p|
      @weather = p.weather
      @wdir = p.wdir
    end
    #寫入資料庫
    WeatherMonthly.find(id).update_attributes( year: year,  month: month, day: day, temp: temp, humd: humd, pres: pres, ocean_temp: ocean_temp, t_min: t_min, t_max: t_max, wave: wave, wdsd: wdsd, wdlv: wdlv, rain: rain, status: status, weather: @weather, wdir: @wdir)
  end

  desc "取得潮汐時間並創建本日報表(每天早上五點執行)"
  task :tide => :environment do
    # 所需套件
    require 'rubygems'
    require 'mechanize'
    # require "methods"

    # 創造一個Object來置入所要抓取的檔案_hourly
    agent = Mechanize.new

    # 抓取氣象局資料(每日即時天氣)
    url = "https://goyeah.tw/tidal/%E6%BE%8E%E6%B9%96%E7%B8%A3%E6%9C%9B%E5%AE%89%E9%84%89"
    doc = agent.get(url)
    headers = []
    doc.xpath('//*/table/thead/tr/th').each do |th|
      headers << th.text
    end
    # get table rows
    rows = []
    doc.xpath('//*/table/tbody/tr').each_with_index do |row, i|
      rows[i] = {}
      row.xpath('td').each_with_index do |td, j|
        rows[i][headers[j]] = td.text
      end
    end
    tide = []
    for i in 0..3
      temp = rows[i]["潮汐 "] + ": " + rows[i]["時間"]
      tide.append(temp)
    end

    get_time
    id = @date.to_i
    WeatherMonthly.create(id: id, tide: tide)
  end
end
