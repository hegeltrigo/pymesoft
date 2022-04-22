require 'rails_helper'

RSpec.describe "Treasury::Journals", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/treasury/journal/index"
      expect(response).to have_http_status(:success)
    end
  end

end
