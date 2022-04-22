class OutputsController < ApplicationController
  before_action :set_output, only: [:show, :edit, :update, :destroy]

  # GET /outputs
  # GET /outputs.json
  def index
    @result = Output.all
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def show
  end

  # GET /outputs/new
  def new
    @output = Output.new
  end

  # GET /outputs/1/edit
  def edit
  end

  # POST /outputs
  # POST /outputs.json
  def create
    @output = Output.new(output_params)

    respond_to do |format|
      if @output.save
        format.html { redirect_to @output, notice: 'Salida fué creada exitosamente.' }
        format.json { render :show, status: :created, location: @output }
      else
        format.html { render :new }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outputs/1
  # PATCH/PUT /outputs/1.json
  def update
    respond_to do |format|
      if @output.update(output_params)
        format.html { redirect_to @output, notice: 'Salida fué modificada exitosamente.' }
        format.json { render :show, status: :ok, location: @output }
      else
        format.html { render :edit }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outputs/1
  # DELETE /outputs/1.json
  def destroy
    @output.destroy
    respond_to do |format|
      format.html { redirect_to outputs_url, notice: 'Salida fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_output
      @output = Output.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def output_params
      params.require(:output).permit(:item_id, :output_date, :description, :quantity)
    end
end
