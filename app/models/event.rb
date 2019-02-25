class Event < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants

  validates :date, :time, :place, :nb_person, presence: true
end
