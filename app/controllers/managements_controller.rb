class ManagementsController < ApplicationController


  def index
    @boats = Boat.all
    @staffs = Staff.all
    @usefuls = Useful.all
    @staff = Staff.new
    @boat = Boat.new
    @useful = Useful.new
  end


  # # GET /boats/1
  # # GET /boats/1.json
  # def show
  # end
  #
  # # GET /boats/new
  # def new
  #   @boat = Boat.new
  # end
  #
  # # GET /boats/1/edit
  # def edit
  # end
  #
  # # POST /boats
  # # POST /boats.json
  # def create
  #   @boat = Boat.new(boat_params)
  #
  #   respond_to do |format|
  #     if @boat.save
  #       format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
  #       format.json { render :show, status: :created, location: @boat }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @boat.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /boats/1
  # # PATCH/PUT /boats/1.json
  # def update
  #   respond_to do |format|
  #     if @boat.update(boat_params)
  #       format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @boat }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @boat.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /boats/1
  # # DELETE /boats/1.json
  # def destroy
  #   @boat.destroy
  #   respond_to do |format|
  #     format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

private
  # Use callbacks to share common setup or constraints between actions.


end
