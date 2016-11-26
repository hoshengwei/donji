class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :edit, :update, :destroy, :mailer]

  # GET /transportations
  # GET /transportations.json
  def index
    @transportations = Transportation.all
  end

  def mailer
    SendMailMailer.transportation(@transportation).deliver_later!
    redirect_to transportations_path, notice: '信件已發送'
  end
  # GET /transportations/1
  # GET /transportations/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TransportationPdf.new(@transportation)
        send_data pdf.render, filename: "海洋國家公園#{@transportation.date}運補船人員名冊.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /transportations/new
  def new
    @transportation = Transportation.new
    1.times {@transportation.transportationcrews.build}
  end

  # GET /transportations/1/edit
  def edit
  end

  # POST /transportations
  # POST /transportations.json
  def create
    @transportation = Transportation.new(transportation_params)

    respond_to do |format|
      if @transportation.save
        format.html { redirect_to @transportation, notice: '運補名冊已新建完成' }
        format.json { render :show, status: :created, location: @transportation }
      else
        format.html { render :new }
        format.json { render json: @transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transportations/1
  # PATCH/PUT /transportations/1.json
  def update
    respond_to do |format|
      if @transportation.update(transportation_params)
        format.html { redirect_to @transportation, notice: '運補名冊已更新完成' }
        format.json { render :show, status: :ok, location: @transportation }
      else
        format.html { render :edit }
        format.json { render json: @transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transportations/1
  # DELETE /transportations/1.json
  def destroy
    @transportation.destroy
    respond_to do |format|
      format.html { redirect_to transportations_url, notice: '本項運補名冊已刪除' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transportation
      @transportation = Transportation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transportation_params
      params.require(:transportation).permit(:date, :year, :month, :day, :status, :direction, :note, :staff_id, transportationcrews_attributes: [:id, :staff_id, :direction, :status, :_destroy])
    end
end
