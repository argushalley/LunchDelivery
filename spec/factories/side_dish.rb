FactoryGirl.define do
  factory :side_dish do
    sequence(:name) {|n| "name#{n}"}
  end
end
