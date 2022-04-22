require "rails_helper"

RSpec.describe OutputsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/outputs").to route_to("outputs#index")
    end

    it "routes to #new" do
      expect(:get => "/outputs/new").to route_to("outputs#new")
    end

    it "routes to #show" do
      expect(:get => "/outputs/1").to route_to("outputs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/outputs/1/edit").to route_to("outputs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/outputs").to route_to("outputs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/outputs/1").to route_to("outputs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/outputs/1").to route_to("outputs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/outputs/1").to route_to("outputs#destroy", :id => "1")
    end

  end
end
