class SalesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  include SalesHelper
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @company_details = CompanyDetail.all.first
  end

  def open_petty_cash
    petty_cash = Treasury::PettyCash.open_petty_cash
    session[:petty_cash_active] = petty_cash
    redirect_to new_sale_path
  end  

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    line_items = params[:sale][:line_items]
    @sale = Sale.new(sale_params.except(:line_items))
    @sale.invoice_id = create_invoice(@sale)
    if @sale.save
      line_items.each do |line_item|
        item = Item.find(line_item[:item_id])
        item.amount_stock -=  line_item[:quantity]
        item.save!
        output = Output.new(item_id: line_item[:item_id], output_date: Time.now, quantity: line_item[:quantity])
        output.save!
        line = LineItem.new(item_id: line_item[:item_id], sale_id:@sale.id, quantiy: line_item[:quantity], detail: line_item[:detail], total_price: line_item[:total_price])

        if !line.save
          puts "El Error es#{line.errors.full_messages}"
        end
      end

      respond_to do |format|
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: invoice_object(@sale), status: :created }
      end

    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @sale.errors, invoice: @sale, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def create_invoice(sale)
      name = sale.customer.first_name + ' ' + sale.customer.last_name
      invoice_dosage = InvoiceDosage.find_by(active: true)
      invoice = Invoice.new(customer_nit: sale.customer.nit, customer_name: name, amount: 
      sale.total_amount, issue_date: Time.now, user_id: current_user.id, invoice_dosage_id: invoice_dosage.id, state: 'Activo')
      invoice.save!
      invoice.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:amount, :total_amount, :remaining_amount, :discount, :tax, :customer_id)
    end

    def invoice_object(sale)
      invoice = {}
      invoice[:invoice] = sale.invoice
      invoice[:sale] = sale
      invoice[:line_items] = sale.line_items
      invoice[:qr_code_text] = sale.invoice.qr_code_text
      invoice[:authorization_number] = sale.invoice.invoice_dosage.authorization_number
      invoice[:company] = CompanyDetail.last
      invoice[:company_logo_url] = url_for(CompanyDetail.last.logo)
      invoice[:total_amount_words] = sale.invoice.amount.to_f.to_words
      return invoice
    end
end
