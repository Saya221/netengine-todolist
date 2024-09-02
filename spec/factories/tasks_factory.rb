# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Name.name }
    sub_title { Faker::Name.name }
    priority { Task.priorities.keys.sample }
    status { Task.statuses.keys.sample }
    due_date { Time.current }
  end
end
