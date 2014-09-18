class TariffOrdersController < ApplicationController
  before_action :set_tariff_order, only: [:show, :edit, :update, :destroy]

  # GET /tariff_orders
  # GET /tariff_orders.json
  def index
    @tariff_orders = TariffOrder.all
  end

  # GET /tariff_orders/1
  # GET /tariff_orders/1.json
  def show
  end

  # GET /tariff_orders/new
  def new
    @tariff_order = TariffOrder.new
    p '--------------modual_number--------'
    @modual_number= params[:modual_number]
    p '-------------------tariff_price----------------------'
    @@modual_id = params[:tariff_price]    
    
  end

  # GET /tariff_orders/1/edit
  def edit
  end

  # POST /tariff_orders
  # POST /tariff_orders.json
  def create
    @tariff_order = TariffOrder.new(tariff_order_params)
    @@modual_id.each do |modual_id|  
      p '~~~~~~~~~~~'
      p modual_id.first
      
    end
    respond_to do |format|
      if @tariff_order.save
        format.html { redirect_to @tariff_order, notice: 'Tariff order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tariff_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @tariff_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tariff_orders/1
  # PATCH/PUT /tariff_orders/1.json
  def update
    respond_to do |format|
      if @tariff_order.update(tariff_order_params)
        format.html { redirect_to @tariff_order, notice: 'Tariff order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tariff_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tariff_orders/1
  # DELETE /tariff_orders/1.json
  def destroy
    @tariff_order.destroy
    respond_to do |format|
      format.html { redirect_to tariff_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tariff_order
      @tariff_order = TariffOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tariff_order_params
      params.require(:tariff_order).permit(:order_online_id, :modual_number, :tariff_price_id)
    end
end
