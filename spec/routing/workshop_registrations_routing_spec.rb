require "rails_helper"

RSpec.describe WorkshopRegistrationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/workshop_registrations").to route_to("workshop_registrations#index")
    end

    it "routes to #new" do
      expect(:get => "/workshop_registrations/new").to route_to("workshop_registrations#new")
    end

    it "routes to #show" do
      expect(:get => "/workshop_registrations/1").to route_to("workshop_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/workshop_registrations/1/edit").to route_to("workshop_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/workshop_registrations").to route_to("workshop_registrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/workshop_registrations/1").to route_to("workshop_registrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/workshop_registrations/1").to route_to("workshop_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/workshop_registrations/1").to route_to("workshop_registrations#destroy", :id => "1")
    end

  end
end
