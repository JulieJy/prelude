class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :libraries
  has_many :games, through: :libraries
  has_many :participants
  has_many :events, through: :participants
  has_many :creator_events, -> {where(participants: {role: 'organizer'})} , through: :participants, source: :event
  has_many :attendee_events, -> {where(participants: {role: 'attendee'})} , through: :participants, source: :event


  validates :first_name, :last_name, presence: true
  phony_normalize :phone_number, default_country_code: 'FR'
  validates :phone_number, phony_plausible: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
