require 'rails_helper'

RSpec.describe InputsController, type: :controller do

  let(:item) { create(:item) }
  let(:supplier) { create(:supplier) }
  let(:valid_attributes) { {item: item, item_id: item.id, quantity: 1 ,input_date: "2019-02-09 20:11:54", supplier: supplier, supplier_id: supplier.id} }

  let(:invalid_attributes) {
    {quantity: ''}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      input = Input.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      input = Input.create! valid_attributes
      get :show, params: {id: input.to_param}, session: valid_session
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
      input = Input.create! valid_attributes
      get :edit, params: {id: input.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Input" do
        expect {
          post :create, params: {input: valid_attributes}, session: valid_session
        }.to change(Input, :count).by(1)
      end

      it "redirects to the created input" do
        post :create, params: {input: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Input.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {input: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
       let(:new_attributes) {
        {item: item, item_id: item.id, quantity: 1 ,input_date: "2019-02-09 20:11:54"}
       }

      it "updates the requested input" do
        input = Input.create! valid_attributes
        put :update, params: {id: input.to_param, input: new_attributes}, session: valid_session
        input.reload
        expect(input.attributes).to include({"item_id" => new_attributes[:item_id]})
      end

      it "redirects to the input" do
        input = Input.create! valid_attributes
        put :update, params: {id: input.to_param, input: valid_attributes}, session: valid_session
        expect(response).to redirect_to(input)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        input = Input.create! valid_attributes
        put :update, params: {id: input.to_param, input: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested input" do
      input = Input.create! valid_attributes
      expect {
        delete :destroy, params: {id: input.to_param}, session: valid_session
      }.to change(Input, :count).by(-1)
    end

    it "redirects to the inputs list" do
      input = Input.create! valid_attributes
      delete :destroy, params: {id: input.to_param}, session: valid_session
      expect(response).to redirect_to(inputs_url)
    end
  end

end
