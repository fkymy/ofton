FactoryGirl.define do
  factory :user do
    id 1
    username '匿名'
    password 'testtest'
    password_confirmation 'testtest'
  end
end
