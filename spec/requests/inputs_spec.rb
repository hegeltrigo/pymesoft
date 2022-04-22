require 'rails_helper'

RSpec.describe "Inputs", type: :request do
  describe "GET /inputs" do
    it "works! (now write some real specs)" do
      get inputs_path
      expect(response).to have_http_status(200)
    end
  end
end
