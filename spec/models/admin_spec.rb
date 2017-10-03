require 'rails_helper'

RSpec.describe Admin, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:admin)).to be_valid
  end

  let(:admin) { FactoryGirl.build(:admin) }

  describe "ActiveModel Validations" do
    it "is valid w :name, :email, :password, :password_confirmation" do
      admin = Admin.new(
        name: 'アドミン',
        email: 'test@example.com',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(admin).to be_valid
    end

    it "is invalid without :name" do
      admin = Admin.new(
        name: '',
        email: 'test@example.com',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(admin).not_to be_valid
    end

    it "is invalid without :email" do
      admin = Admin.new(
        name: 'アドミン',
        email: '',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
      expect(admin).not_to be_valid
    end

    it "is invalid without :password" do
      admin = Admin.new(
        name: 'ペソア',
        email: 'test@example.com',
        password: '',
        password_confirmation: 'testtest'
      )
      expect(admin).not_to be_valid
    end

    it "is invalid without :password_confirmation" do
      admin = Admin.new(
        name: 'ペソア',
        email: 'test@example.com',
        password: 'testtest',
        password_confirmation: ''
      )
      expect(admin).not_to be_valid
    end

    it "is invalid with unmatched :password_confirmation" do
      admin = Admin.new(
        name: 'ペソア',
        email: 'test@example.com',
        password: 'testtest',
        password_confirmation: 'testing'
      )
      expect(admin).not_to be_valid
    end
  end
end
