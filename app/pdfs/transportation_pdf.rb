class TransportationPdf < Prawn::Document
  def initialize(data)  #初始化 導入資料庫參數
    super pagesize: "A4", page_layout: :landscape
    @tp = data
    @crews = @tp.transportationcrews
    font_families["Yen"] = {
      normal: {file: "app/assets/fonts/cwyen.ttf", font: "Yen"}
    }
    font "Yen"
    # 以下為內文
    # 標題
    text "海洋國家公園管理處搭乘東吉嶼-東嶼坪嶼運補船名冊", align: :center , size: 26, leading: 5
    text "日期：#{@tp.year}年#{@tp.month}月#{@tp.day}日", align: :center , size: 16, leading: 5
    move_down 10
    thead = [["單位","職稱","姓名","身份證字號","上島","下島","備註"]]
    table thead, width: 700,
                 cell_style: {align: :center,valign: :center,size: 16, height: 30},
                 column_widths: [120,80,80,140,60,60,160]


    go_to_work unless @crews.where(status: "上島").count == 0
    go_home unless @crews.where(status: "下島").count == 0

    tfoot = [ [content: "共計上島#{@crews.where(status: "上島").count}人、下島#{@crews.where(status: "下島").count}人", colspan: 7],
              [content: "備註： #{@tp.note}", colspan: 7],
              [content: "聯絡電話： #{@tp.concat}",  colspan: 7]  ]
    table tfoot, width: 700,
                 cell_style: {align: :center,valign: :center,size: 16},
                 row_colors: ["FFFFCC","F0F0F0"]

  end

  def go_to_work
    work = []
    @crews.where(status: "上島").each do |crew|
      work << [ Staff.find(crew.staff_id).role,
                 Staff.find(crew.staff_id).title,
                 Staff.find(crew.staff_id).name,
                 Staff.find(crew.staff_id).id_number,
                 "V",
                 "",
                 crew.direction ]
    end
    table work, width: 700,
                 cell_style: {align: :center,valign: :center,size: 16,height: 30},
                 column_widths: [120,80,80,140,60,60,160]
  end

  def go_home
    home = []
    @crews.where(status: "下島").each do |crew|
      home << [ Staff.find(crew.staff_id).role,
                 Staff.find(crew.staff_id).title,
                 Staff.find(crew.staff_id).name,
                 Staff.find(crew.staff_id).id_number,
                 "",
                 "V",
                 crew.direction ]
    end
    table home, width: 700,
                cell_style: {align: :center,valign: :center,size: 16,height: 30},
                column_widths: [120,80,80,140,60,60,160]
  end


end
