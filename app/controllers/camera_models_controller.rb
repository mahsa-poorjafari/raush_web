# encoding: UTF-8
class CameraModelsController < ApplicationController
  before_action :set_camera_model, only: [:show, :edit, :update, :destroy]
  
  # GET /camera_models
  # GET /camera_models.json
  def index
    @camera_models = CameraModel.all
  end

  # GET /camera_models/1
  # GET /camera_models/1.json
  def show
  end

  # GET /camera_models/new
  def new
    @camera_model = CameraModel.new
    @camera_service = Service.find_by( title_en: "camera")
    @camera = Subservice.where( service_id: @camera_service.id )
    
  end

  # GET /camera_models/1/edit
  def edit
    @camera_service = Service.find_by( title_en: "camera")
    @camera = Subservice.where( service_id: @camera_service.id )
  end

  # POST /camera_models
  # POST /camera_models.json
  def create
    @camera_model = CameraModel.new(camera_model_params)

    respond_to do |format|
      if @camera_model.save
        format.html { redirect_to @camera_model, notice: 'Camera model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @camera_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @camera_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camera_models/1
  # PATCH/PUT /camera_models/1.json
  def update
    respond_to do |format|
      if @camera_model.update(camera_model_params)
        format.html { redirect_to @camera_model, notice: 'Camera model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camera_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camera_models/1
  # DELETE /camera_models/1.json
  def destroy
    @camera_model.destroy
    respond_to do |format|
      format.html { redirect_to camera_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera_model
      @camera_model = CameraModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camera_model_params
      params.require(:camera_model).permit(:subservice_id, :title_en, :title_fa, :image, :description_en, :description_fa)
    end
end
