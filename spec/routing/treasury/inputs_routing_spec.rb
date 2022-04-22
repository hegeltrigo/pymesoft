require "rails_helper"

RSpec.describe Treasury::InputsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/treasury/inputs").to route_to("treasury/inputs#index")
    end

    it "routes to #new" do
      expect(get: "/treasury/inputs/new").to route_to("treasury/inputs#new")
    end

    it "routes to #show" do
      expect(get: "/treasury/inputs/1").to route_to("treasury/inputs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/treasury/inputs/1/edit").to route_to("treasury/inputs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/treasury/inputs").to route_to("treasury/inputs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/treasury/inputs/1").to route_to("treasury/inputs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/treasury/inputs/1").to route_to("treasury/inputs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/treasury/inputs/1").to route_to("treasury/inputs#destroy", id: "1")
    end
  end
end
