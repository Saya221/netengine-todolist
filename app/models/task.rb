# frozen_string_literal: true

class Task < ApplicationRecord
  # Validations
  validates :title, :due_date, presence: true

  # Enumerations
  enum priority: %i[low medium high]
  enum status: %i[inprogress completed expired]

  # Scopes
  scope :default, -> { order(updated_at: :desc, due_date: :desc) }

  # Instance Methods
  def status
    expired! if self['status'] == :inprogress && due_date < Time.current
    self['status']
  end
end
