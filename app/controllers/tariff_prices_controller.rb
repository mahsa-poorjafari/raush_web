# encoding: UTF-8
class TariffPricesController < ApplicationController
  before_action :set_tariff_price, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /tariff_prices
  # GET /tariff_prices.json
  def index
    @tariff_prices = TariffPrice.all
  end

  # GET /tariff_prices/1
  # GET /tariff_prices/1.json
  def show
  end

  # GET /tariff_prices/new
  def new
    @tariff_price = TariffPrice.new
  end

  # GET /tariff_prices/1/edit
  def edit
  end

  # POST /tariff_prices
  # POST /tariff_prices.json
  def create
    @tariff_price = TariffPrice.new(tariff_price_params)

    respond_to do |format|
      if @tariff_price.save
        format.html { redirect_to @tariff_price, notice: 'Tariff price was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tariff_price }
      else
        format.html { render action: 'new' }
        format.json { render json: @tariff_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tariff_prices/1
  # PATCH/PUT /tariff_prices/1.json
  def update
    respond_to do |format|
      if @tariff_price.update(tariff_price_params)
        format.html { redirect_to @tariff_price, notice: 'Tariff price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tariff_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tariff_prices/1
  # DELETE /tariff_prices/1.json
  def destroy
    @tariff_price.destroy
    respond_to do |format|
      format.html { redirect_to tariff_prices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tariff_price
      @tariff_price = TariffPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tariff_price_params
      params.require(:tariff_price).permit(:modual, :unit_price, :number, :service_id)
    end
end
