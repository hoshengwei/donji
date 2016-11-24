class AddMapToOceanInspects < ActiveRecord::Migration[5.0]
  def change
    add_column :ocean_inspects, :map, :string
  end
end
