class AddUserScoreToPongs < ActiveRecord::Migration
  def change
    add_column :pongs, :user_score, :integer, default: 0
  end
end
