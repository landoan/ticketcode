class DropColumnEventTypeFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :event_type, :integer
  end
end
