require 'rails_helper'

RSpec.describe Post, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  let(:post) { FactoryGirl.build(:post) }

  describe "ActiveModel Validations" do
    it 'is valid with user_id and body' do
      
    end

    it 'is invalid without body' do

    end

    it 'is invalid with whitespace body' do

    end

    it 'is invalid without user' do

    end

    
  end

  describe "ActiveModel Associations" do
    before(:each) do
      post = FactoryGirl.build(:post)
    end

    it 'belongs to user' do

    end

    it 'has many comments' do

    end

    it 'has many commented_users' do

    end
  end

  describe "scopes" do
    it ".order_by_default returns desc order by id" do
      
    end

    it ".since returns since time" do

    end

    it ".order_by_last_active_at returns desc order by updated_at" do

    end

  end
end
