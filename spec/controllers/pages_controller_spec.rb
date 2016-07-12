require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  login_user
  describe 'GET index' do
    it 'returns a welcome page' do
      get :index
      expect(response.status).to eq 200
      expect(response).to render_template("index")
    end
  end

end
