class Rsvp < ActiveRecord::Base
  has_many :questions
  belongs_to :event
  
end
