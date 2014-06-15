class AccountDocumentsController < ApplicationController
  before_action :set_account_document, only: [:show, :edit, :update, :destroy]

  # GET /account_documents
  # GET /account_documents.json
  def index
    @account_documents = AccountDocument.all
  end

  # GET /account_documents/1
  # GET /account_documents/1.json
  def show
  end

  # GET /account_documents/new
  def new
    @account_document = AccountDocument.new
  end

  # GET /account_documents/1/edit
  def edit
  end

  # POST /account_documents
  # POST /account_documents.json
  def create
    @account_document = AccountDocument.new(account_document_params)

    respond_to do |format|
      if @account_document.save
        format.html { redirect_to @account_document, notice: 'Account document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account_document }
      else
        format.html { render action: 'new' }
        format.json { render json: @account_document.errors, status: :unprocessable_entity }
      end
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
      params.require(:account_document).permit(:payment_date, :value, :paid_to, :paid_by, :payment_group_id, :physical_factor_number, :description)
    end
end
