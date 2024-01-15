class EventsController < ApplicationController
  include AuthorizationConcern

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private
  
  def get_record
    @event = Entity.find(params[:id])
    check_ownership(@event)
  end

  def event_params
    params.require(:event).permit(:name, :story)
  end

end

