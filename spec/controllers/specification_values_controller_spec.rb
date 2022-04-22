require 'rails_helper'

RSpec.describe SpecificationValuesController, type: :controller do
    let(:specification) { create(:specification) }
    let(:valid_attributes) { {specification: specification, specification_id: specification.id, value: 1} }


  let(:invalid_attributes) {
    {value: ''}
  }

  let(:valid_session) { 
    sign_in FactoryBot.create(:user)
  }

  describe "GET #index" do
    it "returns a success response" do
      specification_value = SpecificationValue.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      specification_value = SpecificationValue.create! valid_attributes
      get :show, params: {id: specification_value.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      specification_value = SpecificationValue.create! valid_attributes
      get :edit, params: {id: specification_value.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new specification" do
        expect {
          post :create, params: {specification_value: valid_attributes}, session: valid_session
        }.to change(SpecificationValue, :count).by(1)
      end

      it "redirects to the created specification" do
        post :create, params: {specification_value: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SpecificationValue.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {specification_value: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          value:  Faker::Beer.name,
          specification_id: specification.id
        }
      }

      it "updates the requested specification" do
        specification_value = SpecificationValue.create! valid_attributes
        put :update, params: {id: specification_value.to_param, specification_value: new_attributes}, session: valid_session
        specification_value.reload
        expect(specification_value.attributes).to include({"value" => new_attributes[:value]})
      end

      it "redirects to the specification" do
        specification_value = SpecificationValue.create! valid_attributes
        put :update, params: {id: specification_value.to_param, specification_value: valid_attributes}, session: valid_session
        expect(response).to redirect_to(specification_value)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        specification_value = SpecificationValue.create! valid_attributes
        put :update, params: {id: specification_value.to_param, specification_value: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested specification" do
        specification_value = SpecificationValue.create! valid_attributes
      expect {
        delete :destroy, params: {id: specification_value.to_param}, session: valid_session
      }.to change(SpecificationValue, :count).by(-1)
    end

    it "redirects to the specifications list" do
        specification_value = SpecificationValue.create! valid_attributes
      delete :destroy, params: {id: specification.to_param}, session: valid_session
      expect(response).to redirect_to(specification_values_url)
    end
  end

end
