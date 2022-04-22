class SpecificationsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_specification, only: [:show, :edit, :update, :destroy]

  # GET /specifications
  # GET /specifications.json
  def index
    q_params = {"q": {"name_cont": params[:search]}}
    per_page = params[:limit] || 10
    page = params[:offset] || 0
    @q = Item.ransack(q_params[:q])
    @result = @q.result.page(1).per(per_page).offset(page)
  end

  # GET /specifications/1
  # GET /specifications/1.json
  def show
  end

  # GET /specifications/new
  def new
    @specification = Specification.new
  end

  # GET /specifications/1/edit
  def edit
  end

  # POST /specifications
  # POST /specifications.json
  def create
    @specification = Specification.new(specification_params)

    respond_to do |format|
      if @specification.save
        format.html { redirect_to @specification, notice: 'Especificacion creada exitosamente.' }
        format.json { render :show, status: :created, location: @specification }
      else
        format.html { render :new }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specifications/1
  # PATCH/PUT /specifications/1.json
  def update
    respond_to do |format|
      if @specification.update(specification_params)
        format.html { redirect_to @specification, notice: 'Especificacion actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @specification }
      else
        format.html { render :edit }
        format.json { render json: @specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specifications/1
  # DELETE /specifications/1.json
  def destroy
    @specification.destroy
    respond_to do |format|
      format.html { redirect_to specifications_url, notice: 'Especificacion eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification
      @specification = Specification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specification_params
      params.require(:specification).permit(:name)
    end

end
