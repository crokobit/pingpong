class AddRatesCount < ActiveRecord::Migration
  def change
    add_column :pongs, :rates_count, :integer, default: 0
  end
end
