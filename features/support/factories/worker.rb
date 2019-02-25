FactoryBot.define do
  factory :worker do
    nickname {"Серик"}
    email    {"serik@gmail.com"}
    password {"qweasd"}

    association :role, factory: :role

    after(:create) do |worker|
      worker.role = create(:role)
    end
  end
end