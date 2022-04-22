 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/treasury/petty_cashes", type: :request do
  
  # Treasury::PettyCash. As you add validations to Treasury::PettyCash, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Treasury::PettyCash.create! valid_attributes
      get treasury_petty_cashes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      petty_cash = Treasury::PettyCash.create! valid_attributes
      get treasury_petty_cash_url(treasury_petty_cash)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_treasury_petty_cash_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      petty_cash = Treasury::PettyCash.create! valid_attributes
      get edit_treasury_petty_cash_url(treasury_petty_cash)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Treasury::PettyCash" do
        expect {
          post treasury_petty_cashes_url, params: { treasury_petty_cash: valid_attributes }
        }.to change(Treasury::PettyCash, :count).by(1)
      end

      it "redirects to the created treasury_petty_cash" do
        post treasury_petty_cashes_url, params: { treasury_petty_cash: valid_attributes }
        expect(response).to redirect_to(treasury_petty_cash_url(@treasury_petty_cash))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Treasury::PettyCash" do
        expect {
          post treasury_petty_cashes_url, params: { treasury_petty_cash: invalid_attributes }
        }.to change(Treasury::PettyCash, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post treasury_petty_cashes_url, params: { treasury_petty_cash: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested treasury_petty_cash" do
        petty_cash = Treasury::PettyCash.create! valid_attributes
        patch treasury_petty_cash_url(treasury_petty_cash), params: { treasury_petty_cash: new_attributes }
        petty_cash.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the treasury_petty_cash" do
        petty_cash = Treasury::PettyCash.create! valid_attributes
        patch treasury_petty_cash_url(treasury_petty_cash), params: { treasury_petty_cash: new_attributes }
        petty_cash.reload
        expect(response).to redirect_to(treasury_petty_cash_url(petty_cash))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        petty_cash = Treasury::PettyCash.create! valid_attributes
        patch treasury_petty_cash_url(treasury_petty_cash), params: { treasury_petty_cash: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested treasury_petty_cash" do
      petty_cash = Treasury::PettyCash.create! valid_attributes
      expect {
        delete treasury_petty_cash_url(treasury_petty_cash)
      }.to change(Treasury::PettyCash, :count).by(-1)
    end

    it "redirects to the treasury_petty_cashes list" do
      petty_cash = Treasury::PettyCash.create! valid_attributes
      delete treasury_petty_cash_url(treasury_petty_cash)
      expect(response).to redirect_to(treasury_petty_cashes_url)
    end
  end
end