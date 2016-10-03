class AddImagesToOceanInspects < ActiveRecord::Migration[5.0]
  def change
    add_column :ocean_inspects, :images, :json
  end
end
