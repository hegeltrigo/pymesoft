class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @company_details = CompanyDetail.all.first
    @invoice_dosage = InvoiceDosage.all.last
  end
end
