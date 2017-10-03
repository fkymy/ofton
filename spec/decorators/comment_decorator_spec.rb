require 'rails_helper'

RSpec.describe CommentDecorator do
  let(:user) { FactoryGirl.create(:user, username: '匿名') }
  let(:post) { FactoryGirl.create(:post, user: user) }

  it 'returns :author first in author' do
    comment = FactoryGirl.create(:comment, user: user, post: post, author: 'ペソア')
    expect(comment.decorate.author).to eq('ペソア')
  end

  it 'returns username if no :author' do
    comment = FactoryGirl.create(:comment, user: user, post: post, author: '')
    expect(comment.decorate.author).to eq('匿名さん')
  end
end
