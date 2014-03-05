class AddUserToPong < ActiveRecord::Migration
  def change
    add_reference :pongs, :user, index: true
  end
end
