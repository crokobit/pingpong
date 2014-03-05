class CreatePongs < ActiveRecord::Migration
  def change
    create_table :pongs do |t|
      t.string :gist
      t.string :dhh_gist
      t.integer :votes_count, default: 0
      t.boolean :accepted, default: false
      t.text :description
      t.timestamps
    end
  end
end
