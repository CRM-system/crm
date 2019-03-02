FactoryBot.define do
  factory :worker do
    nickname {"admin"}
    email    {"admin@admin.com"}
    password {"qweasd"}
    admin    {true}
    association :role, factory: :role

    after(:create) do |worker|
      worker.role = create(:role) if worker.role == nil
    end
  end
  # factory :worker do
  #   nickname {"Серик"}
  #   email    {"serik@mail.com"}
  #   password {"qweasd"}
  #   admin    {false}

  #   trait :admin do
  #     name {"admin"}
  #   end

  #   trait :not_admin do
  #     name {"Оператор"}
  #   end
  # end
end