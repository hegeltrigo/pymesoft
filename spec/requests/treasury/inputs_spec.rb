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

RSpec.describe "/treasury/inputs", type: :request do
  
  # Treasury::Input. As you add validations to Treasury::Input, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Treasury::Input.create! valid_attributes
      get treasury_inputs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      input = Treasury::Input.create! valid_attributes
      get treasury_input_url(treasury_input)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_treasury_input_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      input = Treasury::Input.create! valid_attributes
      get edit_treasury_input_url(treasury_input)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Treasury::Input" do
        expect {
          post treasury_inputs_url, params: { treasury_input: valid_attributes }
        }.to change(Treasury::Input, :count).by(1)
      end

      it "redirects to the created treasury_input" do
        post treasury_inputs_url, params: { treasury_input: valid_attributes }
        expect(response).to redirect_to(treasury_input_url(@treasury_input))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Treasury::Input" do
        expect {
          post treasury_inputs_url, params: { treasury_input: invalid_attributes }
        }.to change(Treasury::Input, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post treasury_inputs_url, params: { treasury_input: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested treasury_input" do
        input = Treasury::Input.create! valid_attributes
        patch treasury_input_url(treasury_input), params: { treasury_input: new_attributes }
        input.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the treasury_input" do
        input = Treasury::Input.create! valid_attributes
        patch treasury_input_url(treasury_input), params: { treasury_input: new_attributes }
        input.reload
        expect(response).to redirect_to(treasury_input_url(input))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        input = Treasury::Input.create! valid_attributes
        patch treasury_input_url(treasury_input), params: { treasury_input: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested treasury_input" do
      input = Treasury::Input.create! valid_attributes
      expect {
        delete treasury_input_url(treasury_input)
      }.to change(Treasury::Input, :count).by(-1)
    end

    it "redirects to the treasury_inputs list" do
      input = Treasury::Input.create! valid_attributes
      delete treasury_input_url(treasury_input)
      expect(response).to redirect_to(treasury_inputs_url)
    end
  end
end
