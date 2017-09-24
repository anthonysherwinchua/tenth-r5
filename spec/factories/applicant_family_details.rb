FactoryGirl.define do

  factory :applicant_family_detail do

    association :applicant, factory: :applicant, strategy: :build

    sisters 1
    brothers 2
    no_in_fam 3
    children 4
    eldest 10
    youngest 5

    trait :invalid do
      sisters -1
      brothers -1
      no_in_fam -1
      children -1
      eldest -1
      youngest -1
    end

    trait :as_params do

    end

  end

end
