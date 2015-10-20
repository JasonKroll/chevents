class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  validates_presence_of :email
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true
  validates_presence_of    :name, :on=>:create
  validates_presence_of :address1
  validates_presence_of :suburb
  validates_presence_of :post_code
    
  has_many :listed_events, class_name: "EventGuest",
                           foreign_key: "guest_id",
                           dependent: :destroy
                           
  has_many :events, through: :listed_events, source: "event"    
  
  

  def invited?(event)
    events.include?(event)
  end
  
  def address
    if !address2.blank?
      address1 + ", " + address2 + ", " +  suburb + " " + post_code
    else
      address1 + ", " +  suburb + " " + post_code
    end
  end
  
  def rsvp?
    rsvp = nil
    !rsvp.nil?
  end

end
