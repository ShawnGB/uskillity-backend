require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all categories as @categories" do
      category = FactoryGirl.create(:category)
      get :index, params: {}
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET #show" do
    it "assigns the requested category as @category" do
      category = FactoryGirl.create(:category)
      get :show, params: {id: category.to_param}, session: valid_session
      expect(assigns(:category)).to eq(category)
    end
  end
end
