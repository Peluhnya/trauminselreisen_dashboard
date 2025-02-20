# frozen_string_literal: true

class HotelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:main]
  before_action :set_hotel, only: %i[show edit update destroy]
  layout 'parser', only: :main
  # GET /hotels
  # GET /hotels.json
  def index

    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true)
    @hotel = Hotel.new
  end

  def main
    @q = Hotel.where(active: true).ransack(params[:q])
    @hotels = @q.result(distinct: true)
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show; end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit; end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotels_url, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotels_url, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hotel_params
    params.require(:hotel).permit(:name, :active, :city, :origin_url)
  end
end
