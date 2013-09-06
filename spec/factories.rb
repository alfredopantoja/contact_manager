FactoryGirl.define do
  factory :person do
    first_name "John"
    sequence(:last_name)  { |n| "Doe #{n}" }
  end
end  
