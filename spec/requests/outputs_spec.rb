require 'rails_helper'

RSpec.describe "Outputs", type: :request do
  describe "GET /outputs" do
    it "works! (now write some real specs)" do
      get outputs_path
      expect(response).to have_http_status(200)
    end
  end
end
