FactoryGirl.define do

  factory :requirement do

    association :job_opening, factory: :job_opening, strategy: :build
    association :document, factory: :document, strategy: :build

    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      job_opening_id nil
      document_id nil
    end

  end

end
