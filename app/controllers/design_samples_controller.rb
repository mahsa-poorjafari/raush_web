# encoding: UTF-8
class DesignSamplesController < ApplicationController
  before_action :set_design_sample, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /design_samples
  # GET /design_samples.json
  def index
    @design_samples = DesignSample.all
  end

  # GET /design_samples/1
  # GET /design_samples/1.json
  def show
  end

  # GET /design_samples/new
  def new
    @design_sample = DesignSample.new
  end

  # GET /design_samples/1/edit
  def edit
  end

  # POST /design_samples
  # POST /design_samples.json
  def create
    @design_sample = DesignSample.new(design_sample_params)

    respond_to do |format|
      if @design_sample.save
        format.html { redirect_to @design_sample, notice: 'Design sample was successfully created.' }
        format.json { render action: 'show', status: :created, location: @design_sample }
      else
        format.html { render action: 'new' }
        format.json { render json: @design_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /design_samples/1
  # PATCH/PUT /design_samples/1.json
  def update
    respond_to do |format|
      if @design_sample.update(design_sample_params)
        format.html { redirect_to @design_sample, notice: 'Design sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @design_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /design_samples/1
  # DELETE /design_samples/1.json
  def destroy
    @design_sample.destroy
    respond_to do |format|
      format.html { redirect_to design_samples_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design_sample
      @design_sample = DesignSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def design_sample_params
      params.require(:design_sample).permit(:name, :website, :description, :date, :type)
    end
end
