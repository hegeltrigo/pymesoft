require "rails_helper"

RSpec.describe InvoiceDosagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/invoice_dosages").to route_to("invoice_dosages#index")
    end

    it "routes to #new" do
      expect(:get => "/invoice_dosages/new").to route_to("invoice_dosages#new")
    end

    it "routes to #show" do
      expect(:get => "/invoice_dosages/1").to route_to("invoice_dosages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/invoice_dosages/1/edit").to route_to("invoice_dosages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/invoice_dosages").to route_to("invoice_dosages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/invoice_dosages/1").to route_to("invoice_dosages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/invoice_dosages/1").to route_to("invoice_dosages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/invoice_dosages/1").to route_to("invoice_dosages#destroy", :id => "1")
    end

  end
end
