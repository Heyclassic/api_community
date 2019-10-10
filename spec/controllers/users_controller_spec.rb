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

  context 'the user is already present in the database' do
    let(:user) { Fabricate(:user) }

    it 'updates an existing user' do
      put :update, params: { id: user.id, name: "Giosuè Mizzega" }, as: :json
      expect(response.code).to eq "200"
      expect(response.body).not_to be_empty
      expect(response.body).to include(user.email)
      expect(response.body).to include("Giosuè Mizzega")
      expect(response.body).to include("User updated")
    end

    it 'shows an existing user' do
      user.avatar.attach(io: File.open("addocazz.jpg"), filename: "addocazz.jpg")
      get :show, params: { id: user.id }, as: :json
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(response.body).not_to include(user.password_digest)
      expect(response.body).to include("avatar")
    end
  end
 end
