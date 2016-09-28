class CreateOceanInspects < ActiveRecord::Migration[5.0]
  def change
    create_table :ocean_inspects do |t|
      t.string :s_time, :e_time, :boat, :weather, :wave, :leader, :location, :crew, :gas, :oil, :distance, :captain
      t.text :diary, :work_items, :note
      t.string :yeat, :month, :day
      t.timestamps
    end
  end
end
