require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { FactoryGirl.create(:user, username: '匿名') }

  it 'returns valid username' do
    expect(user.decorate.username).to eq('匿名さん')
  end

  it 'returns valid avatar url' do
    expect(user.decorate.avatar).to eq('animals/bear-square.svg')
  end
end
