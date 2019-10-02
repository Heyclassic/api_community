require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'creates a new user' do
    user = Fabricate.build(:user)
    post :create, params: { user: user }, as: :json
    expect(response.code).to eq "200"
    expect(response.body).not_to be_empty
    expect(response.body).to include(user.email)
    expect(response.body).to include(user.name)
    expect(response.body).to include("User created")
  end

  it 'updates an existing user' do
    user = Fabricate(:user)
    put :update, params: { id: user.id, name: "Giosuè Mizzega" }, as: :json
    expect(response.code).to eq "200"
    expect(response.body).not_to be_empty
    expect(response.body).to include(user.email)
    expect(response.body).to include("Giosuè Mizzega")
    expect(response.body).to include("User updated")
  end
 end
