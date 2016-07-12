require 'rails_helper'

RSpec.describe "WorkshopRegistrations", type: :request do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET /workshop_registrations" do
    it "works! (now write some real specs)" do
      get workshop_registrations_path
      expect(response).to have_http_status(200)
    end
  end
end
