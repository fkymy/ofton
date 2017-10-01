require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  let(:post) { FactoryGirl.build(:comment) }

  describe "ActiveModel Validations" do
  end

  describe "ActiveModel Associations" do
    before(:each) do
      comment = FactoryGirl.build(:comment)
    end
  end

  describe "scopes" do
  end
end
