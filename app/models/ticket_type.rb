class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  def quantity_left
    self.quantity - self.tickets.sum(:quantity)
  end

  def max_available_order
    if quantity_left  >= 10
      10
    else
      quantity_left
    end
  end
end
