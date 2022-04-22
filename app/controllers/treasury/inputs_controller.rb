class Treasury::InputsController < ApplicationController
  before_action :set_treasury_input, only: %i[ show edit update destroy ]

  # GET /treasury/inputs or /treasury/inputs.json
  def index
    if session[:petty_cash_active]
      @petty_cash = Treasury::PettyCash.find(session[:petty_cash_active]["id"])
      q_params = {"q": {"description_cont": params[:search]}}
      per_page = params[:limit] || 10
      page = params[:offset] || 0
      @q = @petty_cash.treasury_inputs.ransack(q_params[:q])
      @result = @q.result.page(1).per(per_page).offset(page)
    else
      @result = []
    end
  end

  # GET /treasury/inputs/1 or /treasury/inputs/1.json
  def show
  end

  # GET /treasury/inputs/new
  def new
    @treasury_input = Treasury::Input.new
  end

  # GET /treasury/inputs/1/edit
  def edit
  end

  # POST /treasury/inputs or /treasury/inputs.json
  def create
    @treasury_input = Treasury::Input.new(treasury_input_params)

    respond_to do |format|
      if @treasury_input.save
        format.html { redirect_to @treasury_input, notice: "Input was successfully created." }
        format.json { render :show, status: :created, location: @treasury_input }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasury_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasury/inputs/1 or /treasury/inputs/1.json
  def update
    respond_to do |format|
      if @treasury_input.update(treasury_input_params)
        format.html { redirect_to @treasury_input, notice: "Input was successfully updated." }
        format.json { render :show, status: :ok, location: @treasury_input }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasury_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasury/inputs/1 or /treasury/inputs/1.json
  def destroy
    @treasury_input.destroy
    respond_to do |format|
      format.html { redirect_to treasury_inputs_url, notice: "Input was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasury_input
      @treasury_input = Treasury::Input.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasury_input_params
      params.require(:treasury_input).permit(:input_date, :description, :quantity, :treasury_petty_cash_id)
    end
end
