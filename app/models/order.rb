class Order < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  accepts_nested_attributes_for :tickets
  validate :at_least_one_ticket

  def at_least_one_ticket
    if self.tickets.size < 1
      errors.add(:tickets, 'cannot be empty')
    elsif self.tickets.map(&:quantity).sum < 1
      errors.add(:tickets, 'must buy at least 1')
    end
  end
end
