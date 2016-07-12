require 'rails_helper'

RSpec.describe WorkshopSessionsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all workshop_sessions as @workshop_sessions" do
      workshop_session = WorkshopSession.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:workshop_sessions)).to eq([workshop_session])
    end
  end

  describe "GET #show" do
    it "assigns the requested workshop_session as @workshop_session" do
      workshop_session = WorkshopSession.create! valid_attributes
      get :show, params: {id: workshop_session.to_param}, session: valid_session
      expect(assigns(:workshop_session)).to eq(workshop_session)
    end
  end

  describe "GET #new" do
    it "assigns a new workshop_session as @workshop_session" do
      get :new, params: {}, session: valid_session
      expect(assigns(:workshop_session)).to be_a_new(WorkshopSession)
    end
  end

  describe "GET #edit" do
    it "assigns the requested workshop_session as @workshop_session" do
      workshop_session = WorkshopSession.create! valid_attributes
      get :edit, params: {id: workshop_session.to_param}, session: valid_session
      expect(assigns(:workshop_session)).to eq(workshop_session)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WorkshopSession" do
        expect {
          post :create, params: {workshop_session: valid_attributes}, session: valid_session
        }.to change(WorkshopSession, :count).by(1)
      end

      it "assigns a newly created workshop_session as @workshop_session" do
        post :create, params: {workshop_session: valid_attributes}, session: valid_session
        expect(assigns(:workshop_session)).to be_a(WorkshopSession)
        expect(assigns(:workshop_session)).to be_persisted
      end

      it "redirects to the created workshop_session" do
        post :create, params: {workshop_session: valid_attributes}, session: valid_session
        expect(response).to redirect_to(WorkshopSession.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workshop_session as @workshop_session" do
        post :create, params: {workshop_session: invalid_attributes}, session: valid_session
        expect(assigns(:workshop_session)).to be_a_new(WorkshopSession)
      end

      it "re-renders the 'new' template" do
        post :create, params: {workshop_session: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested workshop_session" do
        workshop_session = WorkshopSession.create! valid_attributes
        put :update, params: {id: workshop_session.to_param, workshop_session: new_attributes}, session: valid_session
        workshop_session.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested workshop_session as @workshop_session" do
        workshop_session = WorkshopSession.create! valid_attributes
        put :update, params: {id: workshop_session.to_param, workshop_session: valid_attributes}, session: valid_session
        expect(assigns(:workshop_session)).to eq(workshop_session)
      end

      it "redirects to the workshop_session" do
        workshop_session = WorkshopSession.create! valid_attributes
        put :update, params: {id: workshop_session.to_param, workshop_session: valid_attributes}, session: valid_session
        expect(response).to redirect_to(workshop_session)
      end
    end

    context "with invalid params" do
      it "assigns the workshop_session as @workshop_session" do
        workshop_session = WorkshopSession.create! valid_attributes
        put :update, params: {id: workshop_session.to_param, workshop_session: invalid_attributes}, session: valid_session
        expect(assigns(:workshop_session)).to eq(workshop_session)
      end

      it "re-renders the 'edit' template" do
        workshop_session = WorkshopSession.create! valid_attributes
        put :update, params: {id: workshop_session.to_param, workshop_session: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workshop_session" do
      workshop_session = WorkshopSession.create! valid_attributes
      expect {
        delete :destroy, params: {id: workshop_session.to_param}, session: valid_session
      }.to change(WorkshopSession, :count).by(-1)
    end

    it "redirects to the workshop_sessions list" do
      workshop_session = WorkshopSession.create! valid_attributes
      delete :destroy, params: {id: workshop_session.to_param}, session: valid_session
      expect(response).to redirect_to(workshop_sessions_url)
    end
  end

end
