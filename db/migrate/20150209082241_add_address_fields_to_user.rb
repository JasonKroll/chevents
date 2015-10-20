class AddAddressFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :suburb, :string
    add_column :users, :post_code, :string
  end
end
