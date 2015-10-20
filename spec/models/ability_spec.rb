require "spec_helper"
require "cancan/matchers"
# ...
describe "User" do
  describe "abilities" do
    before(:all) do
      @admin = FactoryGirl.create(:user)
      @admin.admin = true
      @user = FactoryGirl.create(:user)
      @admin_ability = Ability.new(@admin)
      @ability = Ability.new(@user)
    end
    
    it "can not create event if not admin" do
      @ability.should_not be_able_to(:create, Event)
      # it{ should_not be_able_to(:manage, Event.new) }
    end    

    it "can create event if admin" do
      @admin_ability.should be_able_to(:create, Event)
      # it{ should_not be_able_to(:manage, Event.new) }
    end  
    
    it "can not create user if not admin" do
      @ability.should_not be_able_to(:create, User)
      # it{ should_not be_able_to(:manage, Event.new) }
    end   
    
    it "can only create user if admin" do
      @admin_ability.should be_able_to(:create, User)
      # it{ should_not be_able_to(:manage, Event.new) }
    end       
    
    it "can not view event if not client" do
      @ability.should_not be_able_to(:view, Event)
      # it{ should_not be_able_to(:manage, Event.new) }
    end       
  
    it "can not add a guest if not admin" do
      event = FactoryGirl.create(:event)

      @ability.should_not be_able_to(:create, EventGuest)
    end     
    
    it "can add a guest to event if admin" do
      event = FactoryGirl.create(:event)
      @admin_ability.should be_able_to(:create, EventGuest)
    end      

    it "can not add a rsvp if not admin" do
      rsvp = FactoryGirl.create(:rsvp)

      @ability.should_not be_able_to(:create, Rsvp)
    end     
   
    it "can add a rsvp if admin" do
      rsvp = FactoryGirl.create(:rsvp)
      @admin_ability.should be_able_to(:create, Rsvp)
    end     

    it "can not add a question if not admin" do
      question = FactoryGirl.create(:question)

      @ability.should_not be_able_to(:create, Question)
    end     
   
  end
end