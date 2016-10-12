class FixedDataColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :ocean_inspects do |t|
      t.string :wday
      t.float :gas_consumption
    end
    remove_column :ocean_inspects, :weather, :string
    remove_column :ocean_inspects, :wave, :string




  end
end
