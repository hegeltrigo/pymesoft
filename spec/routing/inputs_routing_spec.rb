require "rails_helper"

RSpec.describe InputsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inputs").to route_to("inputs#index")
    end

    it "routes to #new" do
      expect(:get => "/inputs/new").to route_to("inputs#new")
    end

    it "routes to #show" do
      expect(:get => "/inputs/1").to route_to("inputs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inputs/1/edit").to route_to("inputs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inputs").to route_to("inputs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inputs/1").to route_to("inputs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inputs/1").to route_to("inputs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inputs/1").to route_to("inputs#destroy", :id => "1")
    end

  end
end
