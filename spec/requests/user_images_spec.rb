require 'rails_helper'

RSpec.describe "UserImages", type: :request do
  describe "GET /user_images" do
    it "works! (now write some real specs)" do
      get user_images_path
      expect(response).to have_http_status(200)
    end
  end
end
