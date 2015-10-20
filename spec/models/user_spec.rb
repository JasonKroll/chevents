require 'spec_helper'
require "cancan/matchers"

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  # FactoryGirl.create() builds the model and saves it, while FactoryGirl.build()
  # instantiates a new model, but doesn’t save it.
  # If we used FactoryGirl.create() in this example it would break before
  # we could even run the test, due to the validation.
  
  it "is invalid without a email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  
  it "is invited to event" do
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event)
    event.add_guest(user)
    user.invited?(event).should be true
  end
  
  it "is invalid without a address1" do
    FactoryGirl.build(:user, address1: nil).should_not be_valid
  end
  
  it "is invalid without a suburb" do
    FactoryGirl.build(:user, address1: nil).should_not be_valid
  end
  
  # it "can only create event if admin" do
  #   user = FactoryGirl.build(:user, admin: false)
  #   ability = Ability.initialize(user)
  #     ability.should_not be_able_to(:create, Event.new)
  # end
end