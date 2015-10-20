class RsvpsController < ApplicationController
  before_action :initialize_rsvp
  
  def show
    
  end
  
  def new
    
  end
  
  def create
    if @rsvp.save
      redirect_to @event
    else
      
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  private
  
  def rsvp_params
    params.require(:rsvp).permit(:event_id)
  end
  
  def initialize_rsvp
    @event = params[:event_id]
    if params.has_key?(:id)
      @rsvp = params[:id]
    else
      @rsvp = @event.build_rsvp
    end
  end
end
