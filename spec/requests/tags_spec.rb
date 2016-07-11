require 'rails_helper'

RSpec.describe "Tags", type: :request do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET /tags" do
    it "works! (now write some real specs)" do
      get tags_path
      expect(response).to have_http_status(200)
    end
  end
end
