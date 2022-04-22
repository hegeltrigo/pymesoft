class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  def index
    @result = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Factura creada exitosamente.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @purchase[:value] = @purchase.value
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Factura de compra actualizada.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Factura de compra eliminada' }
      format.json { head :no_content }
    end
  end

  def book_purchase
  end

  def export_excel
    sql = "select *, suppliers.identifier as nit, suppliers.name as name from purchases
    inner join suppliers on purchases.supplier_id = suppliers.id
    where purchases.created_at >= '#{params[:start_date]}' and purchases.created_at <= '#{params[:end_date].to_date + 1.days}'"
    @purchases = execute(sql)
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="Libro de Compras.xlsx"'
      }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit!
    if params[:purchase][:ticket_type].to_i == 0
      params[:purchase][:invoice_number] = params[:purchase][:value]
      params[:purchase][:dui_number] = nil
    else
      params[:purchase][:dui_number] = params[:purchase][:value]
      params[:purchase][:invoice_number] = nil
    end

    params[:purchase].delete(:value)
    params[:purchase][:ticket_type] = params[:purchase][:ticket_type].to_i
    return params[:purchase]
  end

  def execute(sql)
    ActiveRecord::Base.connection.execute(sql).as_json
  end

end
