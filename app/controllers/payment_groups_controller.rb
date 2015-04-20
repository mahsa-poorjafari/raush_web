class PaymentGroupsController < ApplicationController
  before_action :set_payment_group, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /payment_groups
  # GET /payment_groups.json
  def index
    @payment_groups = PaymentGroup.all
  end

  # GET /payment_groups/1
  # GET /payment_groups/1.json
  def show
  end

  # GET /payment_groups/new
  def new
    @payment_group = PaymentGroup.new
  end

  # GET /payment_groups/1/edit
  def edit
  end

  # POST /payment_groups
  # POST /payment_groups.json
  def create
    @payment_group = PaymentGroup.new(payment_group_params)

    respond_to do |format|
      if @payment_group.save
        format.html { redirect_to @payment_group, notice: 'Payment group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_groups/1
  # PATCH/PUT /payment_groups/1.json
  def update
    respond_to do |format|
      if @payment_group.update(payment_group_params)
        format.html { redirect_to @payment_group, notice: 'Payment group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_groups/1
  # DELETE /payment_groups/1.json
  def destroy
    @payment_group.destroy
    respond_to do |format|
      format.html { redirect_to payment_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_group
      @payment_group = PaymentGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_group_params
      params.require(:payment_group).permit(:title)
    end
end
