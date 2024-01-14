class EventsController < ApplicationController
  #before_action :authorize_user
  before_action :check_ownership, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.select { |x| x.user_id == current_user.id }
  end
  
  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_event
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_event
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :story)
  end
  
  def check_ownership
    begin
      @event = Event.find(params[:id])
      redirect_to events_path and return unless @event.user_id == current_user.id
    rescue
      redirect_to '/404'
    end
  end
  
  def authorize_user
    @privileged = false
    @privileged = current_user.privileged if current_user
  end
end

