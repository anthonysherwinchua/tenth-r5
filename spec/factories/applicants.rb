FactoryGirl.define do

  factory :applicant do

    association :religion, factory: :religion, strategy: :build
    association :citizenship, factory: :citizenship, strategy: :build
    association :civil_status, factory: :civil_status, strategy: :build

    sequence(:first_name) { |i| "First Name #{i}" }
    sequence(:last_name) { |i| "Last Name#{i}" }
    sequence(:middle_name) { |i| "Middle Name #{i}" }
    sequence(:suffix_name) { |i| "Suffix Name #{i}" }
    birthday 18.years.ago
    sequence(:birthplace) { |i| "Birthplace #{i}" }
    gender :female
    height { 160 }
    weight 50
    video_url 'http://www.google.com/somevideo.mpeg'

    trait :invalid do
      religion_id nil
      citizenship_id nil
      civil_status_id nil
      first_name ''
      last_name ''
      middle_name ''
      suffix_name ''
      birthday 17.years.ago
      birthplace ''
      height 0
      weight 0
    end

    trait :as_params do
      birthday 18.years.ago.to_s
      height 160
      weight 50
    end

  end

end
