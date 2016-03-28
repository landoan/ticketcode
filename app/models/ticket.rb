class Ticket < ActiveRecord::Base
  belongs_to :order
  belongs_to :ticket_type

  delegate :name, to: :ticket_type, prefix: false
  delegate :price, to: :ticket_type, prefix: false
  delegate :quantity_left, to: :ticket_type, prefix: false
  delegate :max_available_order, to: :ticket_type, prefix: false
end
