require 'rails_helper'

RSpec.describe "WorkshopSessions", type: :request do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET /workshop_sessions" do
    it "works! (now write some real specs)" do
      get workshop_sessions_path
      expect(response).to have_http_status(200)
    end
  end
end
