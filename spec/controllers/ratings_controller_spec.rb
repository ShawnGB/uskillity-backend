require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all ratings as @ratings" do
      rating = Rating.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:ratings)).to eq([rating])
    end
  end

  describe "GET #show" do
    it "assigns the requested rating as @rating" do
      rating = Rating.create! valid_attributes
      get :show, params: {id: rating.to_param}, session: valid_session
      expect(assigns(:rating)).to eq(rating)
    end
  end

  describe "GET #new" do
    it "assigns a new rating as @rating" do
      get :new, params: {}, session: valid_session
      expect(assigns(:rating)).to be_a_new(Rating)
    end
  end

  describe "GET #edit" do
    it "assigns the requested rating as @rating" do
      rating = Rating.create! valid_attributes
      get :edit, params: {id: rating.to_param}, session: valid_session
      expect(assigns(:rating)).to eq(rating)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Rating" do
        expect {
          post :create, params: {rating: valid_attributes}, session: valid_session
        }.to change(Rating, :count).by(1)
      end

      it "assigns a newly created rating as @rating" do
        post :create, params: {rating: valid_attributes}, session: valid_session
        expect(assigns(:rating)).to be_a(Rating)
        expect(assigns(:rating)).to be_persisted
      end

      it "redirects to the created rating" do
        post :create, params: {rating: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Rating.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved rating as @rating" do
        post :create, params: {rating: invalid_attributes}, session: valid_session
        expect(assigns(:rating)).to be_a_new(Rating)
      end

      it "re-renders the 'new' template" do
        post :create, params: {rating: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: new_attributes}, session: valid_session
        rating.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested rating as @rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: valid_attributes}, session: valid_session
        expect(assigns(:rating)).to eq(rating)
      end

      it "redirects to the rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: valid_attributes}, session: valid_session
        expect(response).to redirect_to(rating)
      end
    end

    context "with invalid params" do
      it "assigns the rating as @rating" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: invalid_attributes}, session: valid_session
        expect(assigns(:rating)).to eq(rating)
      end

      it "re-renders the 'edit' template" do
        rating = Rating.create! valid_attributes
        put :update, params: {id: rating.to_param, rating: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rating" do
      rating = Rating.create! valid_attributes
      expect {
        delete :destroy, params: {id: rating.to_param}, session: valid_session
      }.to change(Rating, :count).by(-1)
    end

    it "redirects to the ratings list" do
      rating = Rating.create! valid_attributes
      delete :destroy, params: {id: rating.to_param}, session: valid_session
      expect(response).to redirect_to(ratings_url)
    end
  end

end
