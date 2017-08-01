FactoryGirl.define do
  factory :comment do
    user_id 1
    article_id 1
    body "MyText"
    commentable_id 1
    commentable_type "MyString"
  end
end
