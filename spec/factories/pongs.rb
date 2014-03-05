# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pong do
    gist "MyString"
    dhh_gist "MyString"
    votes_count 0
    accepted false
    description "MyText"
  end
end
