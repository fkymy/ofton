require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'factory' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    it 'is valid' do
      expect(FactoryGirl.build(:comment, user: user, post: post)).to be_valid
    end
  end

  describe "ActiveModel Validations" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    it 'is valid with :body' do
      comment = FactoryGirl.build(
        :comment,
        user: user,
        post: post,
        body: 'test'
      )
      expect(comment).to be_valid
    end

    it 'is invalid without :body' do
      comment = FactoryGirl.build(
        :comment,
        user: user,
        post: post,
        body: ''
      )
      expect(comment).not_to be_valid
    end

    it 'is invalid with whitespace :body' do
      comment = FactoryGirl.build(
        :comment,
        user: user,
        post: post,
        body: '      '
      )
      expect(comment).not_to be_valid
    end

    it 'is invalid without user' do
      comment = FactoryGirl.build(
        :comment,
        user: nil,
        post: post,
        body: 'test'
      )
      expect(comment).not_to be_valid
    end

    it 'is invalid without post' do
      comment = FactoryGirl.build(
        :comment,
        user: user,
        post: nil,
        body: 'test'
      )
      expect(comment).not_to be_valid
    end
  end

  describe "ActiveModel Associations" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }
    let(:comment) { FactoryGirl.create(:comment, user: user, post: post) }

    it 'belongs to user' do
      expect(comment).to belong_to(:user)
    end

    it 'belongs to post' do
      expect(comment).to belong_to(:post)
    end
  end

  describe "scopes" do
  end
end
