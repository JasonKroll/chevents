FactoryGirl.define do
  factory :question do
    question "Are you coming?"
    yes_no true
    default "yes"
  end

end
