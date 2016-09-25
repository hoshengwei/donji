def get_time (hour_before)
  # 資料時間 (避免氣象局網站更新速度太慢抓取X小時前之資料)
  obstime = Time.now - (hour_before*60*60)
  # 取得離現在時間三小時前的年月日時
  @year = (obstime.year.to_i - 1911).to_s
  @month = obstime.month.to_s.rjust(2, '0')
  @day = obstime.day.to_s.rjust(2, '0')
  @time = obstime.hour.to_s.rjust(2, '0')
  @date = @year + @month + @day
end

def update_weather_monthly_report(date)
  require 'rubygems'
  require 'mechanize'
  agent = Mechanize.new
  url ="http://donji-weather.herokuapp.com/"

  for i in 1..30
    pars = agent.get(url).search("//tr[#{i}]/td[1]").text
    if pars === "#{date}"
      data = agent.get(url).search("//tr[#{i}]/td")
      @temp = data[1].text
      @t_max = data[3].text
      @t_min = data[2].text
      @rain = data[4].text
      @rain_hour = data[5].text
      @sun_rate = data[6].text
      @sun_hour = data[7].text
      @wdsd = data[8].text
      @wd_max = data[9].text
      @humd = data[10].text
      @pres = data[11].text
      @visb = data[12].text
      @status = "更新完成"
      id = date.to_i
      break
    end
  end
  #寫入資料庫
  WeatherMonthly.find(id).update_attributes( temp: @temp, humd: @humd, pres: @pres,  t_min: @t_min, t_max: @t_max, wdsd: @wdsd, wd_max: @wd_max, visb: @visb,  sun_rate: @sun_rate, sun_hour: @sun_hour, rain_hour: @rain_hour, rain: @rain, status: @status, weather: @weather)
end
