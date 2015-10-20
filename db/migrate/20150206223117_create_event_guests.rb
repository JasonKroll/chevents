class CreateEventGuests < ActiveRecord::Migration
  def change
    create_table :event_guests do |t|
      t.integer :event_id
      t.integer :guest_id

      t.timestamps
    end
    add_index :event_guests, :event_id
    add_index :event_guests, :guest_id
    add_index :event_guests, [:event_id, :guest_id], unique: true
  end
end
