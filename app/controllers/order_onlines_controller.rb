# encoding: UTF-8
class OrderOnlinesController < ApplicationController
  before_action :set_order_online, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /order_onlines
  # GET /order_onlines.json
  def index
    @order_onlines = OrderOnline.all
  end

  # GET /order_onlines/1
  # GET /order_onlines/1.json
  def show
  end

  # GET /order_onlines/new
  def new
    @order_online = OrderOnline.new
   
  end

  # GET /order_onlines/1/edit
  def edit
  end

  # POST /order_onlines
  # POST /order_onlines.json
  def create
    @order_online = OrderOnline.new(order_online_params)
    
   if @order_online.save
    if params[:set_modual_numbers].present? and params[:modual_ids].present?
      p '-------------set_modual_numbers-------------'
      p @set_modual_numbers = params[:set_modual_numbers].split(',').map(&:to_i)
      p '-------------modual_ids-------------'
      p @modual_ids = params[:modual_ids].split(',').map(&:to_i)
      @modual_ids.each_with_index do |id, i|
        p '-----each row-----------'        
        p @tariff_order = TariffOrder.create!(:order_online_id => @order_online.id, :tariff_price_id => id, :modual_number => @set_modual_numbers[i])
      end      
    end
    OrderMailer.send_user_order.deliver      
    @deliver = 'کاربر گرامی پیام شما ارسال گردید.'
    end
    render action: 'show'
  end

  # PATCH/PUT /order_onlines/1
  # PATCH/PUT /order_onlines/1.json
  def update
    respond_to do |format|
      if @order_online.update(order_online_params)
        format.html { redirect_to @order_online, notice: 'Order online was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_online.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_onlines/1
  # DELETE /order_onlines/1.json
  def destroy
    @order_online.destroy
    respond_to do |format|
      format.html { redirect_to order_onlines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_online
      @order_online = OrderOnline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_online_params
      params.require(:order_online).permit(:name, :phone, :email, :company_name, :web_site, :mobile, :text_msg)
    end
end
