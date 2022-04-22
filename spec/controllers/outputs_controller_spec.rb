require 'rails_helper'

RSpec.describe OutputsController, type: :controller do

  let(:item) { create(:item) }
  let(:valid_attributes) { {item: item, item_id: item.id, quantity: 1 ,output_date: "2019-02-09 20:11:54"} }

  let(:invalid_attributes) {
    {quantity: ''}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      output = Output.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      output = Output.create! valid_attributes
      get :show, params: {id: output.to_param}, session: valid_session
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
      output = Output.create! valid_attributes
      get :edit, params: {id: output.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Output" do
        expect {
          post :create, params: {output: valid_attributes}, session: valid_session
        }.to change(Output, :count).by(1)
      end

      it "redirects to the created output" do
        post :create, params: {output: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Output.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {output: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {item: item, item_id: item.id, quantity: 1 ,input_date: "2019-02-09 20:11:54"}
       }

      it "updates the requested output" do
        output = Output.create! valid_attributes
        put :update, params: {id: output.to_param, output: new_attributes}, session: valid_session
        output.reload
        expect(output.attributes).to include({"item_id" => new_attributes[:item_id]})
      end

      it "redirects to the output" do
        output = Output.create! valid_attributes
        put :update, params: {id: output.to_param, output: valid_attributes}, session: valid_session
        expect(response).to redirect_to(output)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        output = Output.create! valid_attributes
        put :update, params: {id: output.to_param, output: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested output" do
      output = Output.create! valid_attributes
      expect {
        delete :destroy, params: {id: output.to_param}, session: valid_session
      }.to change(Output, :count).by(-1)
    end

    it "redirects to the outputs list" do
      output = Output.create! valid_attributes
      delete :destroy, params: {id: output.to_param}, session: valid_session
      expect(response).to redirect_to(outputs_url)
    end
  end

end
