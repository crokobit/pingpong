class AddHandyDescriptionToPong < ActiveRecord::Migration
  def change
    add_column :pongs, :intro, :text
  end
end
