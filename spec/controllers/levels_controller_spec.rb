require 'rails_helper'

RSpec.describe LevelsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all levels as @levels" do
      level = Level.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:levels)).to eq([level])
    end
  end

  describe "GET #show" do
    it "assigns the requested level as @level" do
      level = Level.create! valid_attributes
      get :show, params: {id: level.to_param}, session: valid_session
      expect(assigns(:level)).to eq(level)
    end
  end

end
