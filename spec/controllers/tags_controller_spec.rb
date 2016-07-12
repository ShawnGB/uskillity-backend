require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :show, params: {id: tag.to_param}, session: valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tag" do
        expect {
          post :create, params: {tag: valid_attributes}, session: valid_session
        }.to change(Tag, :count).by(1)
      end

      it "assigns a newly created tag as @tag" do
        post :create, params: {tag: valid_attributes}, session: valid_session
        expect(assigns(:tag)).to be_a(Tag)
        expect(assigns(:tag)).to be_persisted
      end

      it "redirects to the created tag" do
        post :create, params: {tag: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Tag.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tag as @tag" do
        post :create, params: {tag: invalid_attributes}, session: valid_session
        expect(assigns(:tag)).to be_a_new(Tag)
      end

      it "re-renders the 'new' template" do
        post :create, params: {tag: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
