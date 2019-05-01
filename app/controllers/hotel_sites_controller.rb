class HotelSitesController < ApplicationController
  before_action :set_hotel_site, only: [:show, :edit, :update, :destroy]

  # GET /hotel_sites
  # GET /hotel_sites.json
  def index
    @hotel_sites = HotelSite.all
  end

  # GET /hotel_sites/1
  # GET /hotel_sites/1.json
  def show
  end

  # GET /hotel_sites/new
  def new
    @hotel_site = HotelSite.new
  end

  # GET /hotel_sites/1/edit
  def edit
  end

  # POST /hotel_sites
  # POST /hotel_sites.json
  def create
    @hotel_site = HotelSite.new(hotel_site_params)

    respond_to do |format|
      if @hotel_site.save
        format.html { redirect_to @hotel_site, notice: 'Hotel site was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_site }
      else
        format.html { render :new }
        format.json { render json: @hotel_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_sites/1
  # PATCH/PUT /hotel_sites/1.json
  def update
    respond_to do |format|
      if @hotel_site.update(hotel_site_params)
        format.html { redirect_to @hotel_site, notice: 'Hotel site was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_site }
      else
        format.html { render :edit }
        format.json { render json: @hotel_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_sites/1
  # DELETE /hotel_sites/1.json
  def destroy
    @hotel_site.destroy
    respond_to do |format|
      format.html { redirect_to hotel_sites_url, notice: 'Hotel site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_site
      @hotel_site = HotelSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_site_params
      params.require(:hotel_site).permit(:hotel_id, :site_id, :link)
    end
end
