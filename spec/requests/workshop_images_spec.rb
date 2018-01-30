require 'rails_helper'

RSpec.describe "WorkshopImages", type: :request do
  describe "GET /workshop_images" do
    it "works! (now write some real specs)" do
      get workshop_images_path
      expect(response).to have_http_status(200)
    end
  end
end
