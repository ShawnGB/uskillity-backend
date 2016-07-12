require "rails_helper"

RSpec.describe WorkshopSessionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/workshop_sessions").to route_to("workshop_sessions#index")
    end

    it "routes to #new" do
      expect(:get => "/workshop_sessions/new").to route_to("workshop_sessions#new")
    end

    it "routes to #show" do
      expect(:get => "/workshop_sessions/1").to route_to("workshop_sessions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/workshop_sessions/1/edit").to route_to("workshop_sessions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/workshop_sessions").to route_to("workshop_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/workshop_sessions/1").to route_to("workshop_sessions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/workshop_sessions/1").to route_to("workshop_sessions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/workshop_sessions/1").to route_to("workshop_sessions#destroy", :id => "1")
    end

  end
end
