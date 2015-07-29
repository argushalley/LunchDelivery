FactoryGirl.define do
  factory :meat do
    sequence(:name) {|n| "name#{n}"}
  end
end
