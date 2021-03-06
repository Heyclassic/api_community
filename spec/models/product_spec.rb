require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_many(:comments)}
  it { is_expected.to belong_to(:user)}
end