FactoryGirl.define do
  factory :user do
    username "user"
    sequence(:name) { |n| "name#{n}" }
    sequence(:email) { |n| "test#{n}@dbc.com" }
    password "pswrd"
    password_confirmation "pswrd"

      factory :invalid_user do
        username nil
      end
  end
end
