FactoryGirl.define do
  factory :admin do
    id 1
    email 'test@example.com'
    password 'testtest'
    password_confirmation 'testtest'
    name 'testadmin'
    slack_id ''
  end
end
