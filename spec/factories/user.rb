FactoryGirl.define do
  factory :user do
    username "user"
    sequence(:name) { |n| "name#{n}" }
    password "pswrd"
    password_confirmation "pswrd"

      factory :invalid_user do
        username nil
      end
  end
end
