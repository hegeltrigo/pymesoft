require 'rails_helper'

RSpec.describe "InvoiceDosages", type: :request do
  describe "GET /invoice_dosages" do
    it "works! (now write some real specs)" do
      get invoice_dosages_path
      expect(response).to have_http_status(200)
    end
  end
end
