require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  let(:valid_attributes) {
    FactoryBot.build(:supplier).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let(:valid_session) { 
    sign_in FactoryBot.create(:user)
  }

  describe "GET #index" do
    it "returns a success response" do
      supplier = Supplier.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      supplier = Supplier.create! valid_attributes
      get :show, params: {id: supplier.to_param}, session: valid_session
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
      supplier = Supplier.create! valid_attributes
      get :edit, params: {id: supplier.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Supplier" do
        expect {
          post :create, params: {supplier: valid_attributes}, session: valid_session
        }.to change(Supplier, :count).by(1)
      end

      it "redirects to the created Supplier" do
        post :create, params: {supplier: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Supplier.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {supplier: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name:  Faker::Beer.name,
          address: Faker::Beer.brand,
          cellphone: "3175489823",
          identifier: "0004"
        }
      }

      it "updates the requested Supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: new_attributes}, session: valid_session
        supplier.reload
        expect(supplier.attributes).to include({"name" => new_attributes[:name]})
      end

      it "redirects to the Supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: valid_attributes}, session: valid_session
        expect(response).to redirect_to(supplier)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested Supplier" do
      supplier = Supplier.create! valid_attributes
      expect {
        delete :destroy, params: {id: supplier.to_param}, session: valid_session
      }.to change(Supplier, :count).by(-1)
    end

    it "redirects to the Suppliers list" do
      supplier = Supplier.create! valid_attributes
      delete :destroy, params: {id: supplier.to_param}, session: valid_session
      expect(response).to redirect_to(suppliers_url)
    end
  end

end
