class Question < ActiveRecord::Base
  validates_presence_of [:question, :default]

end
