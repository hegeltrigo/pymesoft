require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.build(:category).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  let!(:category) { create(:category) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      category = Category.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: category.to_param}, session: valid_session
      expect(response).to have_http_status(200)
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
      get :edit, params: {id: category.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: {category: valid_attributes}, session: valid_session
        }.to change(Category, :count).by(1)
      end

       it "redirects to the created category" do
         post :create, params: {category: valid_attributes}, session: valid_session
         expect(response).to redirect_to(Category.last)
       end
     end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {category: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name:  Faker::Beer.name ,
          description: Faker::Beer.brand
        }
      }

      it "updates the requested category" do
        category = Category.create! valid_attributes
        puts category
        put :update, params: {id: category.to_param, category: new_attributes}, session: valid_session
        category.reload
        expect(category.attributes).to include({"name" => new_attributes[:name]})
      end

      it "redirects to the category" do
        category = Category.create! valid_attributes
        put :update, params: {id: category.to_param, category: valid_attributes}, session: valid_session
        expect(response).to redirect_to(category)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        category = Category.create! valid_attributes
        put :update, params: {id: category.to_param, category: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, params: {id: category.to_param}, session: valid_session
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create! valid_attributes
      delete :destroy, params: {id: category.to_param}, session: valid_session
      expect(response).to redirect_to(categories_url)
    end
  end

end
