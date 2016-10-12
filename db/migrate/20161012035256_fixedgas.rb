class Fixedgas < ActiveRecord::Migration[5.0]
  def change
      change_column :ocean_inspects, :gas_consumption, :string
  end
end
