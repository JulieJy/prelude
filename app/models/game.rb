class Game < ApplicationRecord
  has_many :libraries
  has_many :users, through: :libraries

  validates :name, :nb_player_min, :nb_player_max, :duration, :description, :category, presence: true

  mount_uploader :picture, PhotoUploader
  # mount_uploader :picture, PhotoUploader
end
