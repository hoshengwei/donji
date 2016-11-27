class MailListsController < ApplicationController
  before_action :set_mail_list, only: [:show, :edit, :update, :destroy]

  # GET /mail_lists
  # GET /mail_lists.json
  def index
    @mail_lists = MailList.all
  end

  # GET /mail_lists/1
  # GET /mail_lists/1.json
  def show
  end

  # GET /mail_lists/new
  def new
    @mail_list = MailList.new
  end

  # GET /mail_lists/1/edit
  def edit
  end

  # POST /mail_lists
  # POST /mail_lists.json
  def create
    @mail_list = MailList.new(mail_list_params)

    respond_to do |format|
      if @mail_list.save
        format.html { redirect_to mail_lists_path, notice: '新的寄件地址已新增' }
        format.json { render :show, status: :created, location: @mail_list }
      else
        format.html { render :new }
        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_lists/1
  # PATCH/PUT /mail_lists/1.json
  def update
    respond_to do |format|
      if @mail_list.update(mail_list_params)
        format.html { redirect_to mail_lists_path, notice: '寄件地址已更新' }
        format.json { render :show, status: :ok, location: @mail_list }
      else
        format.html { render :edit }
        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_lists/1
  # DELETE /mail_lists/1.json
  def destroy
    @mail_list.destroy
    respond_to do |format|
      format.html { redirect_to mail_lists_url, notice: '該筆寄件地址已刪除' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_list
      @mail_list = MailList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_list_params
      params.require(:mail_list).permit(:address)
    end
end
