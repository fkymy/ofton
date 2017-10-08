require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:post, user: user)).to be_valid
  end

  describe "ActiveModel Validations" do
    let(:user) { FactoryGirl.create(:user) }

    it 'is valid with :body' do
      post = FactoryGirl.build(
        :post,
        user: user,
        body: 'test'
      )
      expect(post).to be_valid
    end

    it 'is invalid without :body' do
      post = FactoryGirl.build(
        :post,
        user: user,
        body: ''
      )
      expect(post).not_to be_valid
    end

    it 'is invalid with whitespace body' do
      post = FactoryGirl.build(
        :post,
        user: user,
        body: '       '
      )
      expect(post).not_to be_valid
    end

    it 'is invalid without user' do
      post = FactoryGirl.build(
        :post,
        user: nil,
        body: 'test'
      )
      expect(post).not_to be_valid
    end
  end

  describe "ActiveModel Associations" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    it 'belongs to user' do
      expect(post).to belong_to(:user)
    end

    it 'has many comments' do
      expect(post).to have_many(:comments).dependent(:destroy)
    end

    it 'has many commented_users' do
      expect(post).to have_many(:commented_users)
    end
  end

  describe "scopes" do
    it ".order_by_default returns desc order by id"
    it ".since returns since time"
    it ".order_by_last_active_at returns desc order by updated_at"
  end
end
