require 'rails_helper'

RSpec.describe "Levels", type: :request do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET /levels" do
    it "works! (now write some real specs)" do
      get levels_path
      expect(response).to have_http_status(200)
    end
  end
end
