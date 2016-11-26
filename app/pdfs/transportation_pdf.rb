class TransportationPdf < Prawn::Document
  def initialize(data)  #初始化 導入資料庫參數
    super pagesize: "A4", page_layout: :landscape
    @tp = data
    font_families["Yen"] = {
      normal: {file: "app/assets/fonts/cwyen.ttf", font: "Yen"}
    }
    font "Yen"
    # methods
    #以下為內文
    logbooks_content

  end

  # def methods
  #   @id = @tp.year+@tp.month+@tp.day
  #   @weather = WeatherMonthly.find(@id)
  #
  # end

  def logbooks_content
    move_down 10
    text "航行日誌", align: :center , size: 30, leading: 5



  end
end
