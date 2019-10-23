require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { Fabricate(:product) }

  it 'lists all products' do
    get :index, as: :json
    expect(response.status).to eq 200
    expect(response.body).not_to be_empty
  end

  it 'shows a product and its user' do
    get :show, params: { id: product.id }, as: :json
    expect(response.status).to eq 200
    expect(response.body).to include(product.name)
    expect(response.body).to include(product.description)
    expect(response.body).to include(product.user&.name)
  end

  describe 'with logged in user' do

    it 'updates a product' do
      put :update, params: { id: product.id, name: Faker::App.name }, as: :json
      expect(response.status).to eq 200
      expect(response.body).to include "Product updated"
    end

    it 'creates a new tag' do
      put :update, params: { id: product.id, name: Faker::App.name, tags: Faker::IndustrySegments.sector }, as: :json
      expect(response.body["tags"]).not_to be_empty
      expect(product.tag_list.size).to eq 1
    end

    it 'destroys a product' do
      delete :destroy, params: { id: product.id }, as: :json
      expect(response.status).to eq 200
      expect(response.body).to include "Product deleted"
    end

    context 'product has a tag_list' do
      let(:product) { Fabricate(:product_with_tag) }
      let(:tags_array) { tags_array = (1..3).map { |n| Faker::IndustrySegments.sector } }

      it 'adds multiple tags at once' do
        put :update, params: { product: product, id: product.id, tags: tags_array }, as: :json
        expect(response.body["tags"]).not_to be_empty
        expect(product.reload.tag_list.size).to eq (tags_array.size + 1)
      end

      it 'removes multiple tags at once' do
        remove_tags = product.tag_list
        put :update, params: { product: product, id: product.id, remove_tags: remove_tags }, as: :json
        expect(product.reload.tag_list).to be_empty
      end
    end
  end
end
