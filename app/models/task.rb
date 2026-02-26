class Task < ApplicationRecord

  belongs_to :user

  validates :description, presence: true, length: { within: 1..280 }

  scope :today, -> { where(due_at: Time.current) }
  scope :tomorrow, -> { where(due_at: Time.tomorrow) }
  scope :up_next, -> { where("due_at > ?", Time.current) }

  default_scope -> { order(:completed) }

end
