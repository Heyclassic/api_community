require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { Fabricate(:product) }

  it 'lists all products' do
    get :index, as: :json
    expect(response.status).to eq 200
    expect(response.body).not_to be_empty
  end

  it 'shows a product' do
    get :show, params: { id: product.id }, as: :json
    expect(response.status).to eq 200
    expect(response.body).to include(product.name)
    expect(response.body).to include(product.description)
  end

  it 'updates a product' do
    put :update, params: { id: product.id, name: Faker::App.name }, as: :json
    expect(response.status).to eq 200
    expect(response.body).to include "Product updated"
  end
end