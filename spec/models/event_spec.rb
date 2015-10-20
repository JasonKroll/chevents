require 'spec_helper'
require "cancan/matchers"

describe Event do
  it "has a valid factory" do
    FactoryGirl.create(:event).should be_valid
  end

  # FactoryGirl.create() builds the model and saves it, while FactoryGirl.build()
  # instantiates a new model, but doesn’t save it.
  # If we used FactoryGirl.create() in this example it would break before
  # we could even run the test, due to the validation.
  
  it "is invalid without a name" do
    FactoryGirl.build(:event, name: nil).should_not be_valid
  end
  
  it "is invalid without a description" do
    FactoryGirl.build(:event, description: nil).should_not be_valid
  end
  
  it "does not have guest" do
    event = FactoryGirl.create(:event)
    user = FactoryGirl.create(:user)
    event.guest?(user).should == false
  end

  it "has guest" do
    event = FactoryGirl.create(:event)
    user = FactoryGirl.create(:user)
    event.add_guest(user)
    event.guest?(user).should == true
  end

  it "does not have guest after removing it" do
    event = FactoryGirl.create(:event)
    user = FactoryGirl.create(:user)
    event.add_guest(user)
    event.remove_guest(user)
    event.guest?(user).should == false
  end

end