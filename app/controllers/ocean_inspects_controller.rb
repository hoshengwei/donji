class OceanInspectsController < ApplicationController
  before_action :set_ocean_inspect, only: [:show, :edit, :update, :destroy, :logbooks]



  def record
    year = Time.now.year - 1911
    month = Time.now.month
    data = params[:date].to_s.split("-")
    year = data[0].to_i - 1911 if data != []
    month = data[1] if data != []
    @insps = OceanInspect.where(year: year).where(month: month)
    if @insps.length != 0
      respond_to do |format|
        format.xlsx  {
          response.headers['Content-Disposition'] = "attachment; filename=\"#{@insps.first.year}年#{@insps.first.month}月巡護小艇使用紀錄表.xlsx\""
        }
      end
    else
      redirect_to root_path
    end
  end

  # GET /ocean_inspects
  # GET /ocean_inspects.json
  def index
    year = Time.now.year - 1911
    month = Time.now.month
    data = params[:date].to_s.split("-")
    year = data[0].to_i - 1911 if data != []
    month = data[1] if data != []

    @ocean_inspects = OceanInspect.where(year: year).where(month: month).order(:date)
  end

  # GET /ocean_inspects/1
  # GET /ocean_inspects/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OceanInspectPdf.new(@ocean_inspect)
        send_data pdf.render, filename: "澎湖南方四島海洋巡護紀錄表#{@ocean_inspect.year+@ocean_inspect.month+@ocean_inspect.day}.pdf",
                              type: "application/pdf",
                              disposition: "inline"


      end
    end
  end

  def logbooks
    respond_to do |format|
      format.pdf do
        logbooks = LogbooksPdf.new(@ocean_inspect)
        send_data logbooks.render, filename: "#{@ocean_inspect.year+@ocean_inspect.month+@ocean_inspect.day}航行日誌.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /ocean_inspects/new
  def new
    @ocean_inspect = OceanInspect.new
  end

  # GET /ocean_inspects/1/edit
  def edit
  end

  # POST /ocean_inspects
  # POST /ocean_inspects.json
  def create
    @ocean_inspect = OceanInspect.new(ocean_inspect_params)

    respond_to do |format|
      if @ocean_inspect.save
        format.html { redirect_to @ocean_inspect, notice: '海域巡查紀錄新建完成～' }
        format.json { render :show, status: :created, location: @ocean_inspect }
      else
        format.html { render :new }
        format.json { render json: @ocean_inspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocean_inspects/1
  # PATCH/PUT /ocean_inspects/1.json
  def update
    respond_to do |format|
      if @ocean_inspect.update(ocean_inspect_params)
        format.html { redirect_to @ocean_inspect, notice: '海域巡查紀錄更新完成～' }
        format.json { render :show, status: :ok, location: @ocean_inspect }
      else
        format.html { render :edit }
        format.json { render json: @ocean_inspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocean_inspects/1
  # DELETE /ocean_inspects/1.json
  def destroy
    @ocean_inspect.destroy
    respond_to do |format|
      format.html { redirect_to ocean_inspects_url, notice: '已刪除該筆海域巡查紀錄' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocean_inspect
      @ocean_inspect = OceanInspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocean_inspect_params
      params.require(:ocean_inspect).permit( :pics, :map, :pics_cache, :map_cache, :remove_pics, :s_time, :e_time, :boat_id, :weather, :wave, :leader, :location , :crew, :gas, :oil, :distance, :captain, :diary, :work_items, :note, :year, :month, :day, :date,crew: [], location: [], work_items: [], diaries_attributes: [:id, :item, :ocean_inspect_id, :_destroy])
    end
end
