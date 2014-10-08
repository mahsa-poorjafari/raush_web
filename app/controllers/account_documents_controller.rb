# encoding: UTF-8
class AccountDocumentsController < ApplicationController
  before_action :set_account_document, only: [:show, :edit, :update, :destroy, :confirm]
  autocomplete :contact, :company_name, :display_value => :funky_method
  # GET /account_documents
  # GET /account_documents.json
  def index
    @account_documents = AccountDocument.order('created_at desc')
  end

  # GET /account_documents/1
  # GET /account_documents/1.json
  def show
  
  end
  

  # GET /account_documents/new
  def new
    @account_document = AccountDocument.new
    if params[:factor_type].present?      
      p '--------------'
      p @factor_type = params[:factor_type]      
    else
      flash[:FactorTypeEmpty] = 'نوع فاکتور را انتخاب کنید.'      
      redirect_to :back
    end
    
    
    
  end
  
  def profit_month    
    @month = params[:date][:month]   
    if @month.present?
      @date_month = @month
    else
      @date_month = Date.today.month            
    end 
    @raushco = RelatedPerson.find_by_title('شرکت راش')
    @received = AccountDocument.where("MONTH(payment_date) = ? and paid_to = ? and status = ?", @date_month, @raushco, true)        
    @received_sum = @received.sum(:value)    
    @payment = AccountDocument.where("MONTH(payment_date) = ? and paid_by = ? and status = ?", @date_month, @raushco, true)            
    @payment_sum = @payment.sum(:value)
  end
  
  
  def profit
    @current_date_month = Date.today.month
    @raushco = RelatedPerson.find_by_title('شرکت راش')
    @received = AccountDocument.where("MONTH(payment_date) = ? and paid_to = ? and status = ? ", @current_date_month, @raushco, true)        
    @received_sum = @received.sum(:value)    
    @payment = AccountDocument.where("MONTH(payment_date) = ? and paid_by = ? and status = ?", @current_date_month, @raushco, true)            
    @payment_sum = @payment.sum(:value)
    
  end

  # GET /account_documents/1/edit
  def edit
  end
  def confirm
    @account_document.update_attribute(:status, true)
    @save = @account_document.save
  end

  # POST /account_documents
  # POST /account_documents.json
  def create
    @account_document = AccountDocument.new(account_document_params)   
    
    if @account_document.save
      p '--factor_details-----'
      p @account_document.factor_details.each do |fd|
        p '-------fd---------'
        p fd.objecct_price
      end      
      render action: 'show'
    else
      render action: 'new'
      
    end
  
  end

  # PATCH/PUT /account_documents/1
  # PATCH/PUT /account_documents/1.json
  def update
    respond_to do |format|
      if @account_document.update(account_document_params)
        format.html { redirect_to @account_document, notice: 'Account document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_documents/1
  # DELETE /account_documents/1.json
  def destroy
    @account_document.destroy
    respond_to do |format|
      format.html { redirect_to account_documents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_document
      @account_document = AccountDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_document_params
      params.require(:account_document).permit(:payment_date_fa,:paid_by,:paid_to, :value, :payment_group_id, :physical_factor_number, :description, :factor_type, :status,
        factor_details_attributes: [:id, :_destroy, :_update, :object_name, :number_of, :objecct_price, :object_amount, :account_document_id ]        
      )
    end
end
