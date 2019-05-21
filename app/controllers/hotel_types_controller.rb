# frozen_string_literal: true

class HotelTypesController < ApplicationController
  before_action :set_hotel_type, only: %i[show edit update destroy]

  # GET /hotel_types
  # GET /hotel_types.json
  def index
    @hotel_types = HotelType.all
  end

  # GET /hotel_types/1
  # GET /hotel_types/1.json
  def show; end

  # GET /hotel_types/new
  def new
    @hotel_type = HotelType.new
  end

  # GET /hotel_types/1/edit
  
  def edit; end

  # POST /hotel_types
  # POST /hotel_types.json
  def create
    @hotel_type = HotelType.new(hotel_type_params)

    respond_to do |format|
      if @hotel_type.save
        format.html { redirect_to @hotel_type, notice: 'Hotel type was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_type }
      else
        format.html { render :new }
        format.json { render json: @hotel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_types/1
  # PATCH/PUT /hotel_types/1.json
  def update
    respond_to do |format|
      if @hotel_type.update(hotel_type_params)
        format.html { redirect_to @hotel_type, notice: 'Hotel type was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_type }
      else
        format.html { render :edit }
        format.json { render json: @hotel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_types/1
  # DELETE /hotel_types/1.json
  def destroy
    @hotel_type.destroy
    respond_to do |format|
      format.html { redirect_to hotel_types_url, notice: 'Hotel type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel_type
    @hotel_type = HotelType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hotel_type_params
    params.require(:hotel_type).permit(:hotel_site_id, :link, :origin_id)
  end
end
