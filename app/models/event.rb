class Event < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  # has_one :creator_participant, -> { where(role: 'organizer')}, class_name: 'Participant'
  # has_one :creator, through: :creator_participant, source: :user
  has_one :creator_participant, -> { where(role: 'organizer')}, class_name: 'Participant'
  has_one :creator, through: :creator_participant, source: :user
  validates :date, :time, :place, :nb_person, presence: true
  belongs_to :bar, optional: true


  def place_to
    if place == "Bar"
      "#{bar.name}"
    else
      "Chez #{creator.first_name}"
    end
  end

  def address
    if place == "Bar"
      "#{bar.name} - #{bar.address}"
    else
      creator.address
    end
  end

  def date_format
    date.strftime("%d/%m/%Y")
  end

  def time_format
    time.strftime("%k:%M")
  end

  def coordinates
    if bar
      {
        latitude: bar.latitude,
        longitude: bar.longitude
      }
    else
      {
        latitude: creator.latitude,
        longitude: creator.longitude
      }
    end
  end

  attr_accessor :invitation_emails

  after_create :send_invitations

  private

  def send_invitations
    return unless invitation_emails

    invitation_emails.each do |email|
      puts "j'invite #{email}"
    end
  end
end
