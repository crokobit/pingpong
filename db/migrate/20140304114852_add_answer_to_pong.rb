class AddAnswerToPong < ActiveRecord::Migration
  def change
    add_column :pongs, :answer, :text
  end
end
