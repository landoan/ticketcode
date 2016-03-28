class Location < ActiveRecord::Base
  has_many :events
  belongs_to :city
  validates_presence_of :name, :address
end
