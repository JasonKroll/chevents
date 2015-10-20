require 'rails_helper'
require "spec_helper"
require "cancan/matchers"

RSpec.describe Question, :type => :model do
  before(:all) do
    @question = FactoryGirl.create(:question)
  end
  
  it "is invalid without a question" do
    @question.question = nil
    @question.should_not be_valid
  end    

  it "is invalid without a default" do
    @question.default = nil
    @question.should_not be_valid
  end    
end
