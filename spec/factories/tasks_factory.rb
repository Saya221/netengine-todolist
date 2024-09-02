FactoryBot.define do
  factory :task do
    title { Faker::Name.name }
    sub_title { Faker::Name.name }
    priority { Task.priorities.keys.sample }
    due_date { Time.current }
  end
end
