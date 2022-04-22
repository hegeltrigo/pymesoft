class InvoicesController < ApplicationController
  def index
    @search = Invoice.ransack(params[:q])
    @result = @search.result.limit(10)
  end

  def generate_invoice
    @invoice = Invoice.find(params[:id])
    @company_details = CompanyDetail.last
    @invoice_dosage = InvoiceDosage.last
    respond_to do |format|
      format.html
      format.pdf {render template: 'invoices/generate_invoice', pdf: 'Factura'}
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.state = "A"
    @invoice.save!
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Factura fué anulada exitosamente.' }
      format.json { head :no_content }
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end
end