class Event < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  # has_one :creator_participant, -> { where(role: 'organizer')}, class_name: 'Participant'
  # has_one :creator, through: :creator_participant, source: :user
  has_one :creator_participant, -> { where(role: 'organizer')}, class_name: 'Participant'
  has_one :creator, through: :creator_participant, source: :user
  validates :date, :time, :place, :nb_person, presence: true
  belongs_to :bar, optional: true
end
