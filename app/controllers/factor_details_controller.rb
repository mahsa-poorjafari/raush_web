class FactorDetailsController < ApplicationController
  before_action :set_factor_detail, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /factor_details
  # GET /factor_details.json
  def index
    @factor_details = FactorDetail.all
  end

  # GET /factor_details/1
  # GET /factor_details/1.json
  def show
  end

  # GET /factor_details/new
  def new
    @factor_detail = FactorDetail.new
  end

  # GET /factor_details/1/edit
  def edit
  end

  # POST /factor_details
  # POST /factor_details.json
  def create
    @factor_detail = FactorDetail.new(factor_detail_params)
    p '---------'
    p @factor_detail.object_amount = @factor_detail.number_of * @factor_detail.objecct_price
    respond_to do |format|
      if @factor_detail.save
        format.html { redirect_to @factor_detail, notice: 'Factor detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @factor_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @factor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factor_details/1
  # PATCH/PUT /factor_details/1.json
  def update
    
    respond_to do |format|
      if @factor_detail.update(factor_detail_params)
        format.html { redirect_to @factor_detail, notice: 'Factor detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @factor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factor_details/1
  # DELETE /factor_details/1.json
  def destroy
    @factor_detail.destroy
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factor_detail
      @factor_detail = FactorDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factor_detail_params
      params.require(:factor_detail).permit(:object_name, :number_of, :objecct_price, :object_amount, :account_document_id)
    end
end
