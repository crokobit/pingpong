class AddDhhScoreToPongs < ActiveRecord::Migration
  def change
    add_column :pongs, :dhh_score, :integer, default: 0
  end
end
