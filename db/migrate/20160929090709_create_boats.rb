class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.float :fuelConsumption, :fuel_now
      t.timestamps
    end
  end
end
