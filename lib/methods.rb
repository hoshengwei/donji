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

def update_weather_monthly_report
  require 'rubygems'
  require 'mechanize'
  # date = (yy.to_i+1911).to_s + '-' + mm.to_s
  # i = dd.to_i + 2
  # 創造一個Object來置入所要抓取的檔案_hourly
  agent = Mechanize.new
  page = agent.get("http://e-service.cwb.gov.tw/HistoryDataQuery/MonthDataController.do?command=viewMain&station=467300&stname=%25E6%259D%25B1%25E5%2590%2589%25E5%25B3%25B6&datepicker=2016-09")
  # page = agent.get('http://google.com/')
  pp page
  puts page



  # url ="http://e-service.cwb.gov.tw/HistoryDataQuery/MonthDataController.do?command=viewMain&station=467300&stname=%25E6%259D%25B1%25E5%2590%2589%25E5%25B3%25B6&datepicker=#{date}"
  # doc = agent.get(url).search("//tr[#{i}]/td")
  # @temp = doc[7].text
  # @t_max = doc[8].text
  # @t_min = doc[10].text
  # @rain = doc[21].text
  # @rain_hour = doc[22].text
  # @sun_rate = doc[28].text
  # @sun_hour = doc[27].text
  # @wdsd = doc[16].text
  # @wd_max = doc[18].text
  # @humd = doc[13].text
  # @pres = doc[2].text
  # @visb = doc[30].text
  # @status = "更新完成"
  # id = (yy + mm +dd ).to_i

  #寫入資料庫
  # WeatherMonthly.find(id).update_attributes( temp: @temp, humd: @humd, pres: @pres,  t_min: @t_min, t_max: @t_max, wdsd: @wdsd, wd_max: @wd_max, visb: @visb,  sun_rate: @sun_rate, sun_hour: @sun_hour, rain_hour: @rain_hour, rain: @rain, status: @status, weather: @weather)
end
