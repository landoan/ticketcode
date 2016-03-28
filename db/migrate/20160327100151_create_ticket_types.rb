class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
