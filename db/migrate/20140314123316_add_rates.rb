class AddRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :pong, index: true
      t.boolean :up, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
