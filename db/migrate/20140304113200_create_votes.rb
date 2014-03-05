class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :pong, index: true
      t.boolean :dhh, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
