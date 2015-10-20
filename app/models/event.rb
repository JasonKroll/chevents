class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_one :client, class_name: "User"
  has_one :response, class_name: "Rsvp"
  
  has_many :listed_guests, class_name: "EventGuest",
                          foreign_key: "event_id",
                          dependent: :destroy
  has_many :guests, through: :listed_guests, source: "guest"


  def add_guest(user)
    listed_guests.create(guest_id: user.id)
  end
  
  def remove_guest(user)
    listed_guests.find_by(guest_id: user.id).destroy
  end
  
  def guest?(user)
    guests.include?(user)
  end
  
  def total_invited
    total = 0
    guests.each { |g| total += g.number_of_guests  }
    total
  end
  
end
