require "rails_helper"

RSpec.describe SectionsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/pages/1/sections/new").to route_to("sections#new", page_id: "1" )
    end

    it "routes to #edit" do
      expect(get: "/pages/1/sections/1/edit").to route_to("sections#edit", page_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/pages/1/sections").to route_to("sections#create", page_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/pages/1/sections/1").to route_to("sections#update", page_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pages/1/sections/1").to route_to("sections#update", page_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pages/1/sections/1").to route_to("sections#destroy", page_id: "1", id: "1")
    end
  end
end
