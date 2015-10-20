class EventsController < ApplicationController
  before_action :load_event, only: [ :create ]
  load_and_authorize_resource

  def index
    @events = Event.all
  end

  def show
    @guests = @event.guests
  end

  def new
    # @event = Event.new
    unauthorized! if cannot? :create, @event
  end

  def create
    # @event = Event.new(event_params)
    @event.update_attributes(event_params)
    if @event.save
      redirect_to @event
    else
       render :action => "new"
      # flash[:alert] = "Error updating the event"
    end
  end
  
  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to @event
    else
       render :action => "edit"
       flash[:alert] = "Error updating the event"
    end
  end

  def destroy
    if @event.delete
      redirect_to root_path
    end
  end
  def edit_page
    
  end
  def page
    
  end
  private
  
  def event_params
    params.require(:event).permit(:name, :description, :content)
  end

  def load_event
    @event = Event.new(event_params)
  end  
end
