require 'rails_helper'

RSpec.describe CommentsController do
  let(:product) { Fabricate(:product) }
  let(:user) { Fabricate(:user) }

  context 'the comment is not persisted yet' do
    it 'creates a new comment' do
      post :create, params: { product_id: product.id, comment: Comment.new(body: "Great product!", user_id: user.id, product_id: product.id) }, as: :json
      expect(response.status).to eq 200
      expect(response.message).to eq "OK"
    end
  end

  context 'the comment is already persisted' do
    let(:comment) { Fabricate(:comment, product_id: product.id) }

    it 'lists all comments' do
      get :index, params: { product_id: product.id }, as: :json
      expect(response.body).not_to be_empty
      expect(response.status).to eq 200
    end

    it 'shows comment' do
      get :show, params: { product_id: product.id, id: comment.id }, as: :json
      expect(response.body).not_to be_empty
      expect(response.status).to be 200
    end

    it 'updates comment' do
      put :update, params: { comment: comment, product_id: product.id, id: comment.id }, as: :json
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(response.message).to eq "OK"
    end
  end
end