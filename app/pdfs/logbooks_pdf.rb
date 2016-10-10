class LogbooksPdf < Prawn::Document
  def initialize(insp)  #初始化 導入資料庫參數
    super()
    @insp = insp
    font_families["Yen"] = {
      normal: {file: "app/assets/fonts/cwyen.ttf", font: "Yen"}
    }
    font "Yen"
    methods
    #以下為內文
    logbooks_content
    gas
    submit
  end

  def methods
    @id = @insp.year+@insp.month+@insp.day
    @weather = WeatherMonthly.find(@id)

  end

  def logbooks_content
    move_down 10
    text "航行日誌", align: :center , size: 30, leading: 5
    data = [
      [{content: "使用船艇： #{Boat.find(@insp.boat_id).name}" ,height: 35, leading: 5, colspan: 4}],
      [{content: "日  期",rowspan: 2},{content: "#{@insp.year} 年 #{@insp.month} 月 #{@insp.day} 日",rowspan: 2},{content: "天  氣", height: 30},"#{@weather.weather}"],
      [{content: "海  況", height: 30},"#{@weather.wave}米"],
      ["計畫性質",{content: "#{@insp.work_items}", colspan: 3,height: 50}],
      [{content: "領隊", height: 60},"#{Staff.find(@insp.leader).name}","搭載人員","#{@insp.crew}"],
      [{content: "作業地點", rowspan: 2},{content: "#{@insp.location}", rowspan: 2},{content: "出航時間", height: 30},"#{@insp.s_time}"],
      [{content: "返航時間", height: 30},"#{@insp.e_time}"],
    ]
    table(data, width: 530 ,cell_style: {align: :center,valign: :center,size: 14}, column_widths: [70,190,70,200])
  end

  def gas
    data = [
      [{content: "油料添加", height: 30},"汽油      #{@insp.gas}      升","機油      #{@insp.oil}      升"],
      ["本次航行浬程數",{content: "#{@insp.distance} 浬" , colspan: 2, height: 40}],
      [{content: "航行記事（含作業內容或照片等）", colspan: 3 }],
      [{content: "",colspan: 3, height: 200}]
    ]
    table data, width: 530, cell_style: {align: :center,valign: :center,size: 14},column_widths: [70,230,230]
  end

  def submit
    data = [
      [{content: "船長（駕駛", height: 25},"承辦人","站主任"],
      [{content: "", height:70},"",""]
    ]
    table(data, width: 530,cell_style: {align: :center,valign: :center,size: 14},column_widths: [170,170,190] )
  end










  def ocean_inspect_content  # 報表內容
    move_down 10
    text "航行日誌", align: :center , size: 30, leading: 5
    move_down 10
    time = "#{@insp.month} 月 #{@insp.day} 日 |  星期(#{@wday})\n\n進出港時間： #{@insp.s_time}-#{@insp.e_time}"
    tide = "#{@tide[0]}  #{@tide[1]}\n\n#{@tide[2]}  #{@tide[3]}"
    weather = [["天氣：#{@weather.weather}"],["風向：#{@weather.wdir}"]]
    wave = [["風力：#{@weather.wdlv}級"],["浪高：#{@weather.wave}米"]]
    distance = "#{@insp.distance} 海浬 ｜ #{ Boat.find(@insp.boat_id).fuelConsumption.to_f} 公升"
    oil = "#{@insp.gas}"
    if @insp.gas ==="" || @insp.gas.nil?
      oil = "0"
    end
    oil<<(" 公升")
    diary = @insp.diary.gsub!(/<\/ol>/,"").gsub!(/<ol>/,"").gsub!(/\//,"").strip.split("<li>")
    dd = String.new
    n = 1
    (1..diary.count-1).each do |i|
      next if i.even?
      dd += "#{n}.  #{diary[i]}\n"
      n += 1
    end
    map = "public/#{@insp.pics.first.url}"

    data = [
      [{content: time, colspan: 2} ,"\n潮汐時間：",{content: tide, colspan: 2},weather,wave],
      ["巡查地點：",{content: "#{@insp.location}", colspan: 6}],
      ["航程油耗：",{content: distance, colspan: 2},"添加汽油：",{content: oil, colspan: 3}],
      ["執行項目：",{content: "#{@insp.work_items}", colspan: 6}],
      ["巡查紀事：",{content: dd, colspan: 6}],
      ["航行路線：",{image: map, fit:[230,230], position: :center, colspan: 6}]
    ]

    table(data, width: 530, column_widths: {0 => 10, 1 => 130, 2 => 5, 3 => 20, 4 => 120})


  end
end
