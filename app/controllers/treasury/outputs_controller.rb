class Treasury::OutputsController < ApplicationController
  before_action :set_treasury_output, only: %i[ show edit update destroy ]

  # GET /treasury/outputs or /treasury/outputs.json
  def index
    if session[:petty_cash_active]
      @petty_cash = Treasury::PettyCash.find(session[:petty_cash_active]["id"])
      q_params = {"q": {"description_cont": params[:search]}}
      per_page = params[:limit] || 10
      page = params[:offset] || 0
      @q = @petty_cash.treasury_outputs.ransack(q_params[:q])
      @result = @q.result.page(1).per(per_page).offset(page)
    else
      @result = []
    end  
  end

  # GET /treasury/outputs/1 or /treasury/outputs/1.json
  def show
  end

  # GET /treasury/outputs/new
  def new
    @treasury_output = Treasury::Output.new
  end

  # GET /treasury/outputs/1/edit
  def edit
  end

  # POST /treasury/outputs or /treasury/outputs.json
  def create
    @treasury_output = Treasury::Output.new(treasury_output_params)

    respond_to do |format|
      if @treasury_output.save
        format.html { redirect_to @treasury_output, notice: "Output was successfully created." }
        format.json { render :show, status: :created, location: @treasury_output }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasury_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasury/outputs/1 or /treasury/outputs/1.json
  def update
    respond_to do |format|
      if @treasury_output.update(treasury_output_params)
        format.html { redirect_to @treasury_output, notice: "Output was successfully updated." }
        format.json { render :show, status: :ok, location: @treasury_output }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasury_output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasury/outputs/1 or /treasury/outputs/1.json
  def destroy
    @treasury_output.destroy
    respond_to do |format|
      format.html { redirect_to treasury_outputs_url, notice: "Output was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasury_output
      @treasury_output = Treasury::Output.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasury_output_params
      params.require(:treasury_output).permit(:output_date, :description, :quantity, :treasury_petty_cash_id)
    end
end
