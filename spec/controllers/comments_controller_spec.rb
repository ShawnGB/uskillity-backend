require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all comments as @comments" do
      comment = Comment.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #show" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :show, params: {id: comment.to_param}, session: valid_session
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "GET #new" do
    it "assigns a new comment as @comment" do
      get :new, params: {}, session: valid_session
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, params: {id: comment.to_param}, session: valid_session
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Comment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, params: {comment: invalid_attributes}, session: valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {comment: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, params: {id: comment.to_param}, session: valid_session
      expect(response).to redirect_to(comments_url)
    end
  end

end
