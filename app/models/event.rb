class Event < ActiveRecord::Base
  validates_presence_of :name, :start_at, :end_at
  belongs_to :event_type
  belongs_to :user
  delegate :name, to: :event_type, prefix: true
  mount_uploader :event_image, AvatarUploader
  validate :start_at_earlier_than_end_at
  has_many :ticket_types
  has_many :orders

  def start_at_earlier_than_end_at
    if end_at && start_at
      errors.add(:end_at, "must be later than start time") if end_at < start_at
    end
  end


  def self.upcoming
    self.where('start_at > ? AND is_published = ?', Time.current, true)
  end
end
