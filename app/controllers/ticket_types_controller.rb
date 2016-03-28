class TicketTypesController < ApplicationController
  before_filter :set_event

  def index
    @ticket_types = @event.ticket_types
  end

  def create
    @ticket_type = @event.ticket_types.build(type_params)

    if @ticket_type.save
      redirect_to event_ticket_types_path
    else
      render 'index'
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def type_params
    params.require(:ticket_type).permit(:name, :quantity, :price)
  end
end
