class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :role, inclusion: { in: ["organizer", "attendee"]}
end
