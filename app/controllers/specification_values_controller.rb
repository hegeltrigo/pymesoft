class SpecificationValuesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_specification_value, only: [:show, :edit, :update, :destroy]

  # GET /specification_values
  # GET /specification_values.json
  def index
    q_params = {"q": {"value_cont": params[:search]}}
    per_page = params[:limit] || 10
    page = params[:offset] || 0
    @q = SpecificationValue.ransack(q_params[:q])
    @result = @q.result.page(1).per(per_page).offset(page)
  end

  # GET /specification_values/1
  # GET /specification_values/1.json
  def show
  end

  # GET /specification_values/new
  def new
    @specification_value = SpecificationValue.new
  end

  # GET /specification_values/1/edit
  def edit
  end

  # POST /specification_values
  # POST /specification_values.json
  def create
    @specification_value = SpecificationValue.new(specification_value_params)

    respond_to do |format|
      if @specification_value.save
        format.html { redirect_to @specification_value, notice: 'Especificacion creada exitosamente.' }
        format.json { render :show, status: :created, location: @specification_value }
      else
        format.html { render :new }
        format.json { render json: @specification_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specification_values/1
  # PATCH/PUT /specification_values/1.json
  def update
    respond_to do |format|
      if @specification_value.update(specification_value_params)
        format.html { redirect_to @specification_value, notice: 'Especificacion actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @specification_value }
      else
        format.html { render :edit }
        format.json { render json: @specification_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specification_values/1
  # DELETE /specification_values/1.json
  def destroy
    @specification_value.destroy
    respond_to do |format|
      format.html { redirect_to specification_values_url, notice: 'Especificacion eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification_value
      @specification_value = SpecificationValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specification_value_params
      params.require(:specification_value).permit(:value, :specification_id)
    end
end
