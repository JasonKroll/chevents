class AddNumberOfGuestsToUser < ActiveRecord::Migration
  def change
    add_column :users, :number_of_guests, :integer, default: 2
  end
end
