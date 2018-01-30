require 'rails_helper'

RSpec.describe "UserWorkshops", type: :request do
  describe "GET /user_workshops" do
    it "works! (now write some real specs)" do
      get user_workshops_path
      expect(response).to have_http_status(200)
    end
  end
end
