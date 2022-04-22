require "rails_helper"

RSpec.describe Treasury::OutputsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/treasury/outputs").to route_to("treasury/outputs#index")
    end

    it "routes to #new" do
      expect(get: "/treasury/outputs/new").to route_to("treasury/outputs#new")
    end

    it "routes to #show" do
      expect(get: "/treasury/outputs/1").to route_to("treasury/outputs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/treasury/outputs/1/edit").to route_to("treasury/outputs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/treasury/outputs").to route_to("treasury/outputs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/treasury/outputs/1").to route_to("treasury/outputs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/treasury/outputs/1").to route_to("treasury/outputs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/treasury/outputs/1").to route_to("treasury/outputs#destroy", id: "1")
    end
  end
end
