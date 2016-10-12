class Fixed < ActiveRecord::Migration[5.0]
  def change
    change_column :ocean_inspects, :note, :string
    change_column :ocean_inspects, :work_items, :string
  end
end
