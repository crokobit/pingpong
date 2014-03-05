class AddIndexToPongs < ActiveRecord::Migration
  def change
    add_index :pongs, :accepted
  end
end
