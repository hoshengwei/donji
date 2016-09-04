namespace :get_weather do
  desc "This task does nothing"
  task :hourly => :environment do
    # 所需套件
    require 'rubygems'
    require 'mechanize'

    # 資料時間 (避免氣象局網站更新速度太慢抓取三小時前之資料)
    obstime = Time.now - (3*60*60)
    # 創造一個Object來置入所要抓取的檔案_hourly
    agent = Mechanize.new

    #資料庫所需基本數據
    year = (obstime.year.to_i - 1911).to_s
    month = obstime.month.to_s.rjust(2, '0')
    day = obstime.day.to_s.rjust(2, '0')
    time = obstime.hour.to_s.rjust(2, '0')
    weather_monthly_id = (year + month + day).to_s

    # 抓取氣象局資料(每日即時天氣)
    url = "http://www.cwb.gov.tw/V7/observe/24real/Data/46730.htm"
    for i in 2..30
      pars = agent.get(url).search("//tr[#{i}]/th").text.split(" ")
      if pars[0] === ("#{month}/#{day}") && pars[1] ===  ("#{time}:00")
        data = agent.get(url).search("//tr[#{i}]/td")
        temp = data[0].text.to_s
        weather = data[2].text
        wdir = data[3].text
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
        wvdr = pp[4].text
        wvpr = pp[5].text
        ocean_temp = pp[11].text
        break
      end
    end

    # 把資料放進資料庫
    WeatherDaily.create( weather_monthly_id: weather_monthly_id, year: year, month: month, day: day, time: time, temp: temp, weather: weather, wdir: wdir, wdsd: wdsd, wdlv: wdlv, humd: humd, pres: pres, rain: rain, wave: wave, wvdr: wvdr, wvpr: wvpr, ocean_temp: ocean_temp)
  end
end
