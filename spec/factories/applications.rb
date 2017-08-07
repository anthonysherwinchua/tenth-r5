FactoryGirl.define do

  factory :application do

    association :applicant, factory: :applicant, strategy: :build
    association :job_opening, factory: :job_opening, strategy: :build

    sequence(:applicant_code) { |i| "Applicant Code #{i}" }

    trait :invalid do
      applicant_code ''
    end

    trait :as_params do

    end

  end

end
