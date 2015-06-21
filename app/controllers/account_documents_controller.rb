# encoding: UTF-8
class AccountDocumentsController < ApplicationController
  before_action :set_account_document, only: [:show, :edit, :update, :destroy, :confirm]
  autocomplete :contact, :company_name, :display_value => :funky_method
  before_filter :check_autentication
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
    @current_date = JalaliDate.new(Date.today)    
    @current_year = JalaliDate.new(Date.today).strftime("%y")
    if AccountDocument.last.present? && AccountDocument.last.factor_number.present?
      @last_letter = AccountDocument.maximum(:factor_number)      
       @last_letter_split = @last_letter.split('/').last       
       
       @last_letter_split = @last_letter_split.to_i
       @last_letter_split = @last_letter_split + 1
       @last_letter_split = @last_letter_split.to_s
      
    else
      @last_letter_split = 200
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
    @current_date = JalaliDate.new(Date.today)    
    @current_year = JalaliDate.new(Date.today).strftime("%y")
    @counter_number = params[:counter_number]
    @primary_value = @account_document.value
    
    if @account_document.factor_details.present? 
      @account_document.factor_details.each {|fd| fd.object_amount = fd.objecct_price * fd.number_of }      
      p '-------sum------------'
      p @sum = @account_document.factor_details.inject(0){|sum,fd| sum + fd.object_amount.to_i }
      @account_document.update_attributes(:primary_value => @sum)
      @account_document.update_attributes(:value => @sum)
    else
      @account_document.update_attributes(:primary_value => @primary_value) 
    end
    if @current_year && @counter_number
      @factor_number =   'R-' + @current_year + '/' + @counter_number      
      @account_document.factor_number = @factor_number
      
    end
    if @account_document.factor_details.present? 
      if @account_document.save 
        if @account_document.takhfif_precent.present?   && @account_document.takhfif_precent != 0      
          a = @account_document.value * @account_document.takhfif_precent
          @takhfif_total = a / 100
          @account_document.update_attributes(:takhfif_amount => @takhfif_total)               
          @total = @account_document.value - @takhfif_total
          @account_document.update_attributes(:value => @total)          
          @total = 0
        else
          @account_document.update_attributes(:takhfif_precent => 0)
        end
        
        if @account_document.installation_cost_precent.present? && @account_document.installation_cost_precent != 0
          b = @account_document.value * @account_document.installation_cost_precent        
          @inst_total = b / 100
          @account_document.update_attributes(:installation_cost => @inst_total)        
          @total = @account_document.value + @inst_total
          @account_document.update_attributes(:value => @total)          
          @total = 0
        end 
        

        render action: 'show'
      else
        render action: 'new'      
      end  
    else
      flash[:errorfactor] = 'لطفا جزییات فاکتور را وارد کنید.'
      redirect_to :back
    end
  end

  # PATCH/PUT /account_documents/1
  # PATCH/PUT /account_documents/1.json
  def update
    
    if @account_document.update(account_document_params)      
      
      @primary_value = @account_document.value
      if @account_document.factor_details.present?
        @account_document.factor_details.each {|fd| fd.object_amount = fd.objecct_price * fd.number_of }        
        @sum = @account_document.factor_details.inject(0){|sum,fd| sum + fd.object_amount.to_i }
        @account_document.update_attributes(:primary_value => @sum)        
        @account_document.update_attributes(:value => @sum)        
      else
        @account_document.update_attributes(:primary_value => @primary_value) 
      end  
      
      if @account_document.takhfif_precent.present? && @account_document.takhfif_precent != 0
        a = @account_document.value * @account_document.takhfif_precent
        @takhfif_total = a / 100
        @account_document.update_attributes(:takhfif_amount => @takhfif_total)
        @total = @account_document.value - @takhfif_total
        @account_document.update_attributes(:value => @total)        
        @total = 0
      else        
        @account_document.update_attributes(:takhfif_amount => 0)          
      end
      if @account_document.installation_cost_precent.present? && @account_document.installation_cost_precent != 0
        b = @account_document.value * @account_document.installation_cost_precent
        @inst_total = b / 100
        @account_document.update_attributes(:installation_cost => @inst_total)
        @total = @account_document.value  + @inst_total      
        @account_document.update_attributes(:value => @total)          
        @total = 0
      else
        @account_document.update_attributes(:installation_cost => 0)
      end          
      
      
      @account_document.save
      redirect_to @account_document
    else
      render action: 'edit'      
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
      params.require(:account_document).permit(:payment_date_fa,:paid_by,:paid_to, :value, :payment_group_id,
       :physical_factor_number, :description, :factor_type, :status, :takhfif_title, :takhfif_precent,
        :takhfif_amount, :factor_number, :scan_file, :primary_value,
        :installation_cost_title, :installation_cost_precent, :installation_cost, :tavajoh,
        factor_details_attributes: [:id, :_destroy, :_update, :object_name, :number_of, :objecct_price, 
        :object_amount, :account_document_id ],
        payments_attributes: [:id, :_destroy, :_update, :account_document_id, :payment_amount, :payment_type,
         :payment_date, :description ]                
      )
    end
end
