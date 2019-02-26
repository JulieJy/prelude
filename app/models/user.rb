class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :libraries
  has_many :games, through: :libraries
  has_many :participants
  has_many :events, through: :participants

  validates :first_name, :last_name, :address, presence: true
  phony_normalize :phone_number, default_country_code: 'FR'
  validates :phone_number, phony_plausible: true

end
