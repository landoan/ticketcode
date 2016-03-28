require 'time'
class EventsController < ApplicationController
  def index
    @events = Event.upcoming
  end

  def new
    @event = current_user.events.build
    @types = EventType.all
    @locations = Location.all
  end

  def create
    @types = EventType.all
    @event = current_user.events.build(event_params)
    @locations = Location.all
    if params[:event][:start_at] != ''

      @event.start_at = DateTime.strptime(params[:event][:start_at], '%m/%d/%Y %l:%M %p')
    end

    if params[:event][:end_at]!= ''

      @event.end_at = DateTime.strptime(params[:event][:end_at], '%m/%d/%Y %l:%M %p')
    end
    if @event.valid?
      @event.save

      redirect_to event_ticket_types_path(:event_id => @event.id)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @types = EventType.all
    @locations = Location.all
  end

  def update
    @event = Event.find(params[:id])
    if params[:event][:start_at] != ''

      params[:event][:start_at] = DateTime.strptime(params[:event][:start_at], '%m/%d/%Y %l:%M %p')
    end

    if params[:event][:end_at]!= ''

      params[:event][:end_at] = DateTime.strptime(params[:event][:end_at], '%m/%d/%Y %l:%M %p')
    end
    byebug
    if @event.update_attributes(event_params)
      redirect_to events_path
    end
  end

  def show_mine
    @events = current_user.events
  end
  def publish
    @event = Event.find(params[:id])
    if @event.update_attributes(:is_published => true)
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
    @events = Event.where('UPPER(name) LIKE UPPER(?)', "%#{params[:search_text]}%")
    render 'index'
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :event_type_id, :event_image, :start_at,:end_at, :summary, :location_id)
  end
end
