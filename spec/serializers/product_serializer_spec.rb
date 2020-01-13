require 'rails_helper'

RSpec.describe ProductSerializer do
  let(:product) { Fabricate(:product) }
  subject { ProductSerializer.new(product) }
  let(:serialized_product) { subject.serializable_hash }

  it 'returns a hash' do
    expect(serialized_product.class).to eq Hash
  end

  it 'has an array of specific attributes' do
    expect(serialized_product[:data][:attributes].keys).to eq [:added, :maker, :name, :description, :images_paths, :comments, :tags, :votes]
  end
end