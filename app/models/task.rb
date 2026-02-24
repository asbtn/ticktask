class Task < ApplicationRecord

  belongs_to :user

  validate :title, presence: true, length: { min: 1, max: 280 }

  scope :today, -> { where(due_at: Time.current) }
  scope :tomorrow, -> { where(due_at: Time.tomorrow) }
  scope :up_next, -> { where("due_at > ?", Time.current) }

end
