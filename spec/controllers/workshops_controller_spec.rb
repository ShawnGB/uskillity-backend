require 'rails_helper'

RSpec.describe WorkshopsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all workshops as @workshops" do
      workshop = Workshop.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:workshops)).to eq([workshop])
    end
  end

  describe "GET #show" do
    it "assigns the requested workshop as @workshop" do
      workshop = Workshop.create! valid_attributes
      get :show, params: {id: workshop.to_param}, session: valid_session
      expect(assigns(:workshop)).to eq(workshop)
    end
  end

  describe "GET #new" do
    it "assigns a new workshop as @workshop" do
      get :new, params: {}, session: valid_session
      expect(assigns(:workshop)).to be_a_new(Workshop)
    end
  end

  describe "GET #edit" do
    it "assigns the requested workshop as @workshop" do
      workshop = Workshop.create! valid_attributes
      get :edit, params: {id: workshop.to_param}, session: valid_session
      expect(assigns(:workshop)).to eq(workshop)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Workshop" do
        expect {
          post :create, params: {workshop: valid_attributes}, session: valid_session
        }.to change(Workshop, :count).by(1)
      end

      it "assigns a newly created workshop as @workshop" do
        post :create, params: {workshop: valid_attributes}, session: valid_session
        expect(assigns(:workshop)).to be_a(Workshop)
        expect(assigns(:workshop)).to be_persisted
      end

      it "redirects to the created workshop" do
        post :create, params: {workshop: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Workshop.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workshop as @workshop" do
        post :create, params: {workshop: invalid_attributes}, session: valid_session
        expect(assigns(:workshop)).to be_a_new(Workshop)
      end

      it "re-renders the 'new' template" do
        post :create, params: {workshop: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, params: {id: workshop.to_param, workshop: new_attributes}, session: valid_session
        workshop.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, params: {id: workshop.to_param, workshop: valid_attributes}, session: valid_session
        expect(assigns(:workshop)).to eq(workshop)
      end

      it "redirects to the workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, params: {id: workshop.to_param, workshop: valid_attributes}, session: valid_session
        expect(response).to redirect_to(workshop)
      end
    end

    context "with invalid params" do
      it "assigns the workshop as @workshop" do
        workshop = Workshop.create! valid_attributes
        put :update, params: {id: workshop.to_param, workshop: invalid_attributes}, session: valid_session
        expect(assigns(:workshop)).to eq(workshop)
      end

      it "re-renders the 'edit' template" do
        workshop = Workshop.create! valid_attributes
        put :update, params: {id: workshop.to_param, workshop: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workshop" do
      workshop = Workshop.create! valid_attributes
      expect {
        delete :destroy, params: {id: workshop.to_param}, session: valid_session
      }.to change(Workshop, :count).by(-1)
    end

    it "redirects to the workshops list" do
      workshop = Workshop.create! valid_attributes
      delete :destroy, params: {id: workshop.to_param}, session: valid_session
      expect(response).to redirect_to(workshops_url)
    end
  end

end
