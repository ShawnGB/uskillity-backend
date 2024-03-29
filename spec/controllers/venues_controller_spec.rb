require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all venues as @venues" do
      venue = Venue.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:venues)).to eq([venue])
    end
  end

  describe "GET #show" do
    it "assigns the requested venue as @venue" do
      venue = Venue.create! valid_attributes
      get :show, params: {id: venue.to_param}, session: valid_session
      expect(assigns(:venue)).to eq(venue)
    end
  end

  describe "GET #new" do
    it "assigns a new venue as @venue" do
      get :new, params: {}, session: valid_session
      expect(assigns(:venue)).to be_a_new(Venue)
    end
  end

  describe "GET #edit" do
    it "assigns the requested venue as @venue" do
      venue = Venue.create! valid_attributes
      get :edit, params: {id: venue.to_param}, session: valid_session
      expect(assigns(:venue)).to eq(venue)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Venue" do
        expect {
          post :create, params: {venue: valid_attributes}, session: valid_session
        }.to change(Venue, :count).by(1)
      end

      it "assigns a newly created venue as @venue" do
        post :create, params: {venue: valid_attributes}, session: valid_session
        expect(assigns(:venue)).to be_a(Venue)
        expect(assigns(:venue)).to be_persisted
      end

      it "redirects to the created venue" do
        post :create, params: {venue: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Venue.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved venue as @venue" do
        post :create, params: {venue: invalid_attributes}, session: valid_session
        expect(assigns(:venue)).to be_a_new(Venue)
      end

      it "re-renders the 'new' template" do
        post :create, params: {venue: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested venue" do
        venue = Venue.create! valid_attributes
        put :update, params: {id: venue.to_param, venue: new_attributes}, session: valid_session
        venue.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested venue as @venue" do
        venue = Venue.create! valid_attributes
        put :update, params: {id: venue.to_param, venue: valid_attributes}, session: valid_session
        expect(assigns(:venue)).to eq(venue)
      end

      it "redirects to the venue" do
        venue = Venue.create! valid_attributes
        put :update, params: {id: venue.to_param, venue: valid_attributes}, session: valid_session
        expect(response).to redirect_to(venue)
      end
    end

    context "with invalid params" do
      it "assigns the venue as @venue" do
        venue = Venue.create! valid_attributes
        put :update, params: {id: venue.to_param, venue: invalid_attributes}, session: valid_session
        expect(assigns(:venue)).to eq(venue)
      end

      it "re-renders the 'edit' template" do
        venue = Venue.create! valid_attributes
        put :update, params: {id: venue.to_param, venue: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested venue" do
      venue = Venue.create! valid_attributes
      expect {
        delete :destroy, params: {id: venue.to_param}, session: valid_session
      }.to change(Venue, :count).by(-1)
    end

    it "redirects to the venues list" do
      venue = Venue.create! valid_attributes
      delete :destroy, params: {id: venue.to_param}, session: valid_session
      expect(response).to redirect_to(venues_url)
    end
  end

end
