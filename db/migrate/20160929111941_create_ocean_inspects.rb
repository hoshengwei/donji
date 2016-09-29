class CreateOceanInspects < ActiveRecord::Migration[5.0]
  def change
    create_table :ocean_inspects do |t|
      t.string :s_time
      t.string :e_time
      t.integer :boat_id
      t.string :weather
      t.string :wave
      t.string :leader
      t.string :location
      t.string :crew
      t.string :gas
      t.string :oil
      t.string :distance
      t.string :captain
      t.text :diary
      t.text :work_items
      t.text :note
      t.string :year
      t.string :month
      t.string :day
      t.string :date

      t.timestamps
    end
  end
end
