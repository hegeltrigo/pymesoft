class Treasury::PettyCashesController < ApplicationController
  before_action :set_treasury_petty_cash, only: %i[ show edit update destroy ]

  # GET /treasury/petty_cashes or /treasury/petty_cashes.json
  def index
    @treasury_petty_cashes = Treasury::PettyCash.all
  end

  # GET /treasury/petty_cashes/1 or /treasury/petty_cashes/1.json
  def show
  end

  # GET /treasury/petty_cashes/new
  def new
    @treasury_petty_cash = Treasury::PettyCash.new
  end

  def close_petty_cash
    Treasury::PettyCash.close(params[:id])
    session[:petty_cash_active] = nil
    redirect_to treasury_journal_index_path
  end  

  # GET /treasury/petty_cashes/1/edit
  def edit
  end

  # POST /treasury/petty_cashes or /treasury/petty_cashes.json
  def create
    @treasury_petty_cash = Treasury::PettyCash.new(treasury_petty_cash_params)

    respond_to do |format|
      if @treasury_petty_cash.save
        format.html { redirect_to @treasury_petty_cash, notice: "Petty cash was successfully created." }
        format.json { render :show, status: :created, location: @treasury_petty_cash }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treasury_petty_cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treasury/petty_cashes/1 or /treasury/petty_cashes/1.json
  def update
    respond_to do |format|
      if @treasury_petty_cash.update(treasury_petty_cash_params)
        format.html { redirect_to @treasury_petty_cash, notice: "Petty cash was successfully updated." }
        format.json { render :show, status: :ok, location: @treasury_petty_cash }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treasury_petty_cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treasury/petty_cashes/1 or /treasury/petty_cashes/1.json
  def destroy
    @treasury_petty_cash.destroy
    respond_to do |format|
      format.html { redirect_to treasury_petty_cashes_url, notice: "Petty cash was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasury_petty_cash
      @treasury_petty_cash = Treasury::PettyCash.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treasury_petty_cash_params
      params.require(:treasury_petty_cash).permit(:start_date, :end_date)
    end
end
