class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.order('created_at desc')
    @account_documents = AccountDocument.where(factor_type: 'cost').order('created_at desc')
    
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @factor_number= params[:factor_number]
    @related_account = AccountDocument.find_by_factor_number(@factor_number)    
    @payments_related_account = Payment.where(account_document_id: @related_account)
    @sum_payment = @payments_related_account.sum(:payment_amount)
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to :back, notice: 'Payment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:account_document_id, :payment_amount, :payment_type, :payment_date_fa, :description)
    end
end
