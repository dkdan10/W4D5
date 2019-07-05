require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    # Here we're using FactoryBot, but you could use anything
    # subject { build(:user) }

    it {should validate_presence_of :username}
    it {should validate_presence_of :password_digest}
    it {should validate_presence_of :session_token}

    it {should validate_length_of(:password).is_at_least(6)}

  end

  describe "uniqueness" do
    subject { create(:user) }
    it {should validate_uniqueness_of(:session_token)}
    it {should validate_uniqueness_of(:username)}
  end

  describe "User::find_by_credentials" do

    let!(:user) {create(:user)}

    context "when credentials are valid" do
      
      it 'returns the correct user' do
        expect( User.find_by_credentials(user.username, "staten_pete_davidson_island")).to eq(user)
      end
    end

    context "when credentials are invalid" do
      it 'should return nil' do
        expect( User.find_by_credentials("not_my_username", "lonely_pete_davidson_island")).to be(nil)
      end
    end

  end


end