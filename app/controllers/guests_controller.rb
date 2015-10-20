class GuestsController < ApplicationController
  before_action :setup_existing, only: [ :show, :destroy, :invite, :create_invite]
  
  def new
    @guest = User.new
  end
  
  def create
    name = params[:user][:name]
    email = params[:user][:email]
    event_id  = params[:event_id]
    @event = Event.find(event_id)
    @guest = User.find_by(email: email)
    if @guest.nil?
      generated_password = Devise.friendly_token.first(8)
      # @guest = User.new(name: name, email: email, password: generated_password, password_confirmation: generated_password)
      @guest = User.new(guest_params)
      @guest.password = generated_password
      @guest.password_confirmation = generated_password
      if @guest.save
        @event.add_guest(@guest)
        flash[:notice] = 'User was successfully invited!'
        redirect_to event_path(@event)
      else
        render :action => "new"
      end
    else
      # guest already exists
      redirect_to invite_event_guest_path(@event, @guest)
    end
  end
  
  def show
  end
  
  def destroy
    if @guest.events.count > 1
      @event.remove_guest(@guest)
      redirect_to event_path(@event)
    else
      if @guest.destroy
        redirect_to event_path(@event)
      end
    end
  end
  
  def invite
  end
  
  def create_invite
    @event.add_guest(@guest) if !@guest.invited?(@event) 
    redirect_to event_path(@event)
  end
  
  private
  
  def guest_params
    params.require(:user).permit(:name, :email, :address1, :address2, :post_code, :suburb, :number_of_guests, )
  end

  def setup_existing
    @guest = User.find(params[:id])
    @event = Event.find(params[:event_id])
  end
end

