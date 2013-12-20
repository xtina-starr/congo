# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_to_prod, :class => 'UserToProds' do
    user_id 1
    product_id 1
  end
end
