class BookSalesController < ApplicationController

  def index

  end

  def export_excel
    
    sql = "select *, invoice_dosages.authorization_number as authorization_number from invoices 
    inner join invoice_dosages on invoice_dosages.id = invoices.invoice_dosage_id
    where invoices.created_at between '#{params[:start_date]}' and '#{params[:end_date]}'"
    @invoices = execute(sql)
    respond_to do |format|
      format.xlsx
    end
  end

  def execute(sql)
    ActiveRecord::Base.connection.execute(sql).as_json
  end
end
