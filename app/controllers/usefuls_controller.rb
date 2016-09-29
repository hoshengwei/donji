class UsefulsController < ApplicationController
  before_action :set_useful, only: [:show, :edit, :update, :destroy]

  # GET /usefuls
  # GET /usefuls.json
  def index
    @usefuls = Useful.all
  end

  # GET /usefuls/1
  # GET /usefuls/1.json
  def show
  end

  # GET /usefuls/new
  def new
    @useful = Useful.new
  end

  # GET /usefuls/1/edit
  def edit
  end

  # POST /usefuls
  # POST /usefuls.json
  def create
    @useful = Useful.new(useful_params)

    respond_to do |format|
      if @useful.save
        format.html { redirect_to @useful, notice: 'Useful was successfully created.' }
        format.json { render :show, status: :created, location: @useful }
      else
        format.html { render :new }
        format.json { render json: @useful.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usefuls/1
  # PATCH/PUT /usefuls/1.json
  def update
    respond_to do |format|
      if @useful.update(useful_params)
        format.html { redirect_to @useful, notice: 'Useful was successfully updated.' }
        format.json { render :show, status: :ok, location: @useful }
      else
        format.html { render :edit }
        format.json { render json: @useful.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usefuls/1
  # DELETE /usefuls/1.json
  def destroy
    @useful.destroy
    respond_to do |format|
      format.html { redirect_to usefuls_url, notice: 'Useful was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useful
      @useful = Useful.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def useful_params
      params.require(:useful).permit(:name, :catalog)
    end
end
