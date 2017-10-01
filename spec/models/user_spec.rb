require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  # Lazily loaded to ensure it's only used when needed
  let(:user) { FactoryGirl.build(:user) }

  describe "ActiveModel Validations" do
    it "is valid w :username, :password, :password_confirmation" do
      user = User.new(
        username: 'ペソア',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(user).to be_valid
    end

    it "is invalid without :username" do
      user = User.new(
        username: nil,
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(user).not_to be_valid
    end

    it "is invalid with whitespace :username" do
      user = User.new(
        username: '    ',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(user).not_to be_valid
    end


    it "is invalid without :password" do
      user = User.new(
        username: 'ペソア',
        password: '',
        password_confirmation: 'testtest'
      )
      expect(user).not_to be_valid
    end

    it "is invalid without :password_confirmation" do
      user = User.new(
        username: 'ペソア',
        password: 'testtest',
        password_confirmation: ''
      )
      expect(user).not_to be_valid
    end

    it "is invalid with unmatched :password_confirmation" do
      user = User.new(
        username: 'ペソア',
        password: 'testtest',
        password_confirmation: 'testtes'
      )
      expect(user).not_to be_valid
    end

    it "is invalid with a duplicate :username" do
      User.create(
        username: 'ペソア',
        password: 'testtest',
        password_confirmation: 'testtest'
      )

      duplicate_user = User.new(
        username: 'ペソア',
        password: 'duplicateuser',
        password_confirmation: 'duplicateuser'
      )
      expect(duplicate_user).not_to be_valid
    end
  end

  describe "ActiveModel Associations" do
    before(:each) do
      user = FactoryGirl.build(:user)
    end

    it "has many posts" do
      expect(user).to have_many(:posts).dependent(:destroy)
    end

    it "has many comments" do
      expect(user).to have_many(:comments).dependent(:destroy)
    end

    it "has many commented_posts" do
      expect(user).to have_many(:commented_posts)
    end
  end
end
