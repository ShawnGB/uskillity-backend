require 'rails_helper'

RSpec.describe WorkshopRegistrationsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all workshop_registrations as @workshop_registrations" do
      workshop_registration = WorkshopRegistration.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:workshop_registrations)).to eq([workshop_registration])
    end
  end

  describe "GET #show" do
    it "assigns the requested workshop_registration as @workshop_registration" do
      workshop_registration = WorkshopRegistration.create! valid_attributes
      get :show, params: {id: workshop_registration.to_param}, session: valid_session
      expect(assigns(:workshop_registration)).to eq(workshop_registration)
    end
  end

  describe "GET #new" do
    it "assigns a new workshop_registration as @workshop_registration" do
      get :new, params: {}, session: valid_session
      expect(assigns(:workshop_registration)).to be_a_new(WorkshopRegistration)
    end
  end

  describe "GET #edit" do
    it "assigns the requested workshop_registration as @workshop_registration" do
      workshop_registration = WorkshopRegistration.create! valid_attributes
      get :edit, params: {id: workshop_registration.to_param}, session: valid_session
      expect(assigns(:workshop_registration)).to eq(workshop_registration)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WorkshopRegistration" do
        expect {
          post :create, params: {workshop_registration: valid_attributes}, session: valid_session
        }.to change(WorkshopRegistration, :count).by(1)
      end

      it "assigns a newly created workshop_registration as @workshop_registration" do
        post :create, params: {workshop_registration: valid_attributes}, session: valid_session
        expect(assigns(:workshop_registration)).to be_a(WorkshopRegistration)
        expect(assigns(:workshop_registration)).to be_persisted
      end

      it "redirects to the created workshop_registration" do
        post :create, params: {workshop_registration: valid_attributes}, session: valid_session
        expect(response).to redirect_to(WorkshopRegistration.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved workshop_registration as @workshop_registration" do
        post :create, params: {workshop_registration: invalid_attributes}, session: valid_session
        expect(assigns(:workshop_registration)).to be_a_new(WorkshopRegistration)
      end

      it "re-renders the 'new' template" do
        post :create, params: {workshop_registration: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested workshop_registration" do
        workshop_registration = WorkshopRegistration.create! valid_attributes
        put :update, params: {id: workshop_registration.to_param, workshop_registration: new_attributes}, session: valid_session
        workshop_registration.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested workshop_registration as @workshop_registration" do
        workshop_registration = WorkshopRegistration.create! valid_attributes
        put :update, params: {id: workshop_registration.to_param, workshop_registration: valid_attributes}, session: valid_session
        expect(assigns(:workshop_registration)).to eq(workshop_registration)
      end

      it "redirects to the workshop_registration" do
        workshop_registration = WorkshopRegistration.create! valid_attributes
        put :update, params: {id: workshop_registration.to_param, workshop_registration: valid_attributes}, session: valid_session
        expect(response).to redirect_to(workshop_registration)
      end
    end

    context "with invalid params" do
      it "assigns the workshop_registration as @workshop_registration" do
        workshop_registration = WorkshopRegistration.create! valid_attributes
        put :update, params: {id: workshop_registration.to_param, workshop_registration: invalid_attributes}, session: valid_session
        expect(assigns(:workshop_registration)).to eq(workshop_registration)
      end

      it "re-renders the 'edit' template" do
        workshop_registration = WorkshopRegistration.create! valid_attributes
        put :update, params: {id: workshop_registration.to_param, workshop_registration: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workshop_registration" do
      workshop_registration = WorkshopRegistration.create! valid_attributes
      expect {
        delete :destroy, params: {id: workshop_registration.to_param}, session: valid_session
      }.to change(WorkshopRegistration, :count).by(-1)
    end

    it "redirects to the workshop_registrations list" do
      workshop_registration = WorkshopRegistration.create! valid_attributes
      delete :destroy, params: {id: workshop_registration.to_param}, session: valid_session
      expect(response).to redirect_to(workshop_registrations_url)
    end
  end

end
