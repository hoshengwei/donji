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
