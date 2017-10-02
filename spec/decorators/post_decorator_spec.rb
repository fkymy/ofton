require 'rails_helper'

RSpec.describe PostDecorator do
  let(:user) { FactoryGirl.create(:user, username: '匿名') }

  it 'returns :author first in author' do
    post = FactoryGirl.create(:post, user: user, author: 'ペソア')
    expect(post.decorate.author).to eq('ペソア')
  end

  it 'returns username if no :author' do
    post = FactoryGirl.create(:post, user: user, author: '')
    expect(post.decorate.author).to eq('匿名さん')
  end
end
