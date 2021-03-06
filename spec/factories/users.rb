FactoryGirl.define do

  sequence(:email) {|n| "user.#{n}@domain.com" }
  sequence(:username) {|n| "username#{n}" }

  factory :user do

    name "First Middle Last"
    username
    email

    phone "123-456-7890"
    skype "skype"
    linkedin "Linked In"

    city "Mysore"
    state "Karnataka"
    country "India"

    password_digest { SecureRandom.hex }
    password ConfigCenter::Defaults::PASSWORD
    password_confirmation ConfigCenter::Defaults::PASSWORD

  end

  factory :normal_user, parent: :user do

    designation
    designation_overridden "Designation Custom"
    department

    biography "A programmer by profession. A student of history and music by passion. Uses Ruby, Python and Javascript. Work as an Web Architect for Qwinix"

  end

  factory :pending_user, parent: :normal_user do
    status "pending"
  end

  factory :approved_user, parent: :normal_user do
    status "approved"
  end

  factory :blocked_user, parent: :normal_user do
    status "blocked"
  end

  factory :admin_user, parent: :user do
    user_type "admin"
  end

  factory :super_admin_user, parent: :user do
    user_type "super_admin"
  end

end
