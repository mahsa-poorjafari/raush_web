class SubservicesController < ApplicationController
  before_action :set_subservice, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /subservices
  # GET /subservices.json
  def index
    @subservices = Subservice.all
  end

  # GET /subservices/1
  # GET /subservices/1.json
  def show
  end

  # GET /subservices/new
  def new
    @subservice = Subservice.new
  end

  # GET /subservices/1/edit
  def edit
  end

  # POST /subservices
  # POST /subservices.json
  def create
    @subservice = Subservice.new(subservice_params)

    respond_to do |format|
      if @subservice.save
        format.html { redirect_to @subservice, notice: 'Subservice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subservice }
      else
        format.html { render action: 'new' }
        format.json { render json: @subservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subservices/1
  # PATCH/PUT /subservices/1.json
  def update
    respond_to do |format|
      if @subservice.update(subservice_params)
        format.html { redirect_to @subservice, notice: 'Subservice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subservices/1
  # DELETE /subservices/1.json
  def destroy
    @subservice.destroy
    respond_to do |format|
      format.html { redirect_to subservices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subservice
      @subservice = Subservice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subservice_params
      params.require(:subservice).permit(:text_fa, :text_en, :title_en, :title_fa, :service_id, :image)
    end
end
