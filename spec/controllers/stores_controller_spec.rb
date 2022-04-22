require 'rails_helper'

RSpec.describe StoresController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.build(:store).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {name: Faker::Name.name, description: nil}
  }

  let(:valid_session) { sign_in FactoryBot.create(:user) }

  describe "GET #index" do
    it "returns a success response" do
      store = Store.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      store = Store.create! valid_attributes
      get :show, params: {id: store.to_param}, session: valid_session
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
      store = Store.create! valid_attributes
      get :edit, params: {id: store.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new store" do
        expect {
          post :create, params: {store: valid_attributes}, session: valid_session
        }.to change(Store, :count).by(1)
      end

      it "redirects to the created store" do
        post :create, params: {store: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Store.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {store: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name:  Faker::Beer.name,
          description: Faker::Company.bs
        }
      }

      it "updates the requested store" do
        store = Store.create! valid_attributes
        put :update, params: {id: store.to_param, store: new_attributes}, session: valid_session
        store.reload
        expect(store.attributes).to include({"name" => new_attributes[:name]})
      end

      it "redirects to the store" do
        store = Store.create! valid_attributes
        put :update, params: {id: store.to_param, store: valid_attributes}, session: valid_session
        expect(response).to redirect_to(store)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        store = Store.create! valid_attributes
        put :update, params: {id: store.to_param, store: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested store" do
      store = Store.create! valid_attributes
      expect {
        delete :destroy, params: {id: store.to_param}, session: valid_session
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the stores list" do
      store = Store.create! valid_attributes
      delete :destroy, params: {id: store.to_param}, session: valid_session
      expect(response).to redirect_to(stores_url)
    end
  end

end
