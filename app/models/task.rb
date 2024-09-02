# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :due_date, presence: true

  enum priority: %i[low medium high]
end
