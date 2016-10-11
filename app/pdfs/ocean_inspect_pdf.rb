class OceanInspectPdf < Prawn::Document
  def initialize(insp)  #初始化 導入資料庫參數
    super()
    @insp = insp
    font_families["Kai"] = {
      normal: {file: "app/assets/fonts/cwkai.ttf", font: "Kai"}
    }
    font "Kai"
    methods
    ocean_inspect_content
    pics if !@insp.pics.second.nil?
    crew
    move_down 10
    submit
  end

  def methods
    wday_i = @insp.date.to_date.wday.to_i
    wday = "日" if wday_i === 0
    wday = "一" if wday_i === 1
    wday = "二" if wday_i === 2
    wday = "三" if wday_i === 3
    wday = "四" if wday_i === 4
    wday = "五" if wday_i === 5
    wday = "六" if wday_i === 6
    @id = @insp.year+@insp.month+@insp.day
    @wday = wday
    @weather = WeatherMonthly.find(@id)
    @tide = @weather.tide.gsub!(/[\[\]\"]/, "").split(",")

  end

  def ocean_inspect_content  # 報表內容
    text "澎湖南方四島國家公園海洋巡護紀錄表", align: :center , size: 30, leading: 5
    move_down 10
    time = "#{@insp.month} 月 #{@insp.day} 日 |  星期(#{@wday})\n\n進出港時間： #{@insp.s_time}-#{@insp.e_time}"
    tide = "#{@tide[0]}  #{@tide[1]}\n\n#{@tide[2]}  #{@tide[3]}"
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
      [{content: time, colspan: 2, rowspan: 2} ,{content: "潮汐時間：",rowspan: 2, valign: :center},{content: tide, colspan: 2, rowspan: 2},"天氣：#{@weather.weather}","風力：#{@weather.wdlv} 級"],
      ["風向：#{@weather.wdir}","浪高：#{@weather.wave}米"],
      ["巡查地點：",{content: "#{@insp.location}", colspan: 6}],
      ["航程油耗：",{content: distance, colspan: 2},"添加汽油：",{content: oil, colspan: 3}],
      ["執行項目：",{content: "#{@insp.work_items}", colspan: 6}],
      ["巡查紀事：",{content: dd, colspan: 6}],
      ["航行路線：",{image: map, fit:[220,180], position: :center, colspan: 6}]
    ]

    table(data, width: 530, column_widths: {0 => 10, 1 => 130, 2 => 5, 3 => 20, 4 => 120})


  end

  def pics
    pic = "public/#{@insp.pics.second.url}"
    table([["巡查照片：",{image: pic, fit:[220,180], position: :center, colspan: 6}]],width: 530, column_widths: {0 => 70})
  end
  def crew
    data = [
      ["備註：",{content: @insp.note, colspan: 6}],
      ["巡查人員：",{content: "#{Staff.find(@insp.leader).name} 、 #{@insp.crew}", colspan: 6}],
      ["船長：",{content: "#{Staff.find(@insp.captain).name}", colspan: 6}]
    ]
    table(data, width: 530, column_widths: {0 => 70})
  end
  def submit
    text "陳核" ,size: 20, leading: 5
    move_down 5
    data = [
      [{content: "紀錄：", size: 15, border_width: 2},{content: "主管：", size: 15, height: 40, border_width: 2}]
    ]
    table(data, width: 530)
  end

end
