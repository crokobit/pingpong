class AddRatingToPong < ActiveRecord::Migration
  def change
    add_column :pongs, :rating, :integer, default: 0
  end
end
