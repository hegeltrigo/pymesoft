require 'rails_helper'

RSpec.describe SpecificationsController, type: :controller do
  let(:valid_attributes) {
    FactoryBot.build(:specification).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:valid_session) { 
    sign_in FactoryBot.create(:user)
  }

  describe "GET #index" do
    it "returns a success response" do
      specification = Specification.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      specification = Specification.create! valid_attributes
      get :show, params: {id: specification.to_param}, session: valid_session
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
      specification = Specification.create! valid_attributes
      get :edit, params: {id: specification.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new specification" do
        expect {
          post :create, params: {specification: valid_attributes}, session: valid_session
        }.to change(Specification, :count).by(1)
      end

      it "redirects to the created specification" do
        post :create, params: {specification: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Specification.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {specification: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name:  Faker::Beer.name
        }
      }

      it "updates the requested specification" do
        specification = Specification.create! valid_attributes
        put :update, params: {id: specification.to_param, specification: new_attributes}, session: valid_session
        specification.reload
        expect(specification.attributes).to include({"name" => new_attributes[:name]})
      end

      it "redirects to the specification" do
        specification = Specification.create! valid_attributes
        put :update, params: {id: specification.to_param, specification: valid_attributes}, session: valid_session
        expect(response).to redirect_to(specification)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        specification = Specification.create! valid_attributes
        put :update, params: {id: specification.to_param, specification: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested specification" do
      specification = Specification.create! valid_attributes
      expect {
        delete :destroy, params: {id: specification.to_param}, session: valid_session
      }.to change(Specification, :count).by(-1)
    end

    it "redirects to the specifications list" do
      specification = Specification.create! valid_attributes
      delete :destroy, params: {id: specification.to_param}, session: valid_session
      expect(response).to redirect_to(specifications_url)
    end
  end

end
