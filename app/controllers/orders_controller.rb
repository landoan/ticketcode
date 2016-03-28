class OrdersController < ApplicationController
  before_filter :set_event
  before_filter :set_new_order

  def new
    @ticket_types = @event.ticket_types
    @tickets = []
    @ticket_types.each do |type|
      @tickets << @order.tickets.build(ticket_type_id: type.id, quantity: 0)
    end
  end

  def create
    @order.attributes = order_params

    if @order.save
      render 'thank_you'
    else
      render 'new'
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_new_order
    @order = @event.orders.build(user: current_user)
  end

  def order_params
    params.require(:order).permit(tickets_attributes: [:id, :ticket_type_id, :quantity])
  end
end
