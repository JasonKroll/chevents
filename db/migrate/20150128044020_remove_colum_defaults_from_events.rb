class RemoveColumDefaultsFromEvents < ActiveRecord::Migration
  def change
    change_column_default(:events, :name, nil)
    change_column_default(:events, :description, nil) 
  end
end
