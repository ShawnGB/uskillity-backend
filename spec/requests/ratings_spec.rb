require 'rails_helper'

RSpec.describe "Ratings", type: :request do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET /ratings" do
    it "works! (now write some real specs)" do
      get ratings_path
      expect(response).to have_http_status(200)
    end
  end
end
