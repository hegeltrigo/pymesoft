class InvoiceDosagesController < ApplicationController
  before_action :set_invoice_dosage, only: [:show, :edit, :update, :destroy]

  # GET /invoice_dosages
  # GET /invoice_dosages.json
  def index
    @q = InvoiceDosage.ransack(params[:q])
    @result = @q.result
  end

  # GET /invoice_dosages/1
  # GET /invoice_dosages/1.json
  def show
  end

  # GET /invoice_dosages/new
  def new
    @invoice_dosage = InvoiceDosage.new
  end

  # GET /invoice_dosages/1/edit
  def edit
  end

  # POST /invoice_dosages
  # POST /invoice_dosages.json
  def create
    @invoice_dosage = InvoiceDosage.new(invoice_dosage_params)
    @invoice_dosage.active = true
    respond_to do |format|
      if @invoice_dosage.save
        format.html { redirect_to @invoice_dosage, notice: 'Dosificación creada exitosamente.' }
        format.json { render :show, status: :created, location: @invoice_dosage }
      else
        format.html { render :new }
        format.json { render json: @invoice_dosage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_dosages/1
  # PATCH/PUT /invoice_dosages/1.json
  def update
    respond_to do |format|
      if @invoice_dosage.update(invoice_dosage_params)
        format.html { redirect_to @invoice_dosage, notice: 'Dosificación modificada exitosamente.' }
        format.json { render :show, status: :ok, location: @invoice_dosage }
      else
        format.html { render :edit }
        format.json { render json: @invoice_dosage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_dosages/1
  # DELETE /invoice_dosages/1.json
  def destroy
    @invoice_dosage.destroy
    respond_to do |format|
      format.html { redirect_to invoice_dosages_url, notice: 'Dosificación eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_dosage
      @invoice_dosage = InvoiceDosage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_dosage_params
      params.require(:invoice_dosage).permit(:authorization_number, :emission_deadline, :invoice_initial_number, :dosage_key, :economic_activity, :active, :legend, :computarized)
    end
end
