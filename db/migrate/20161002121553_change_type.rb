class ChangeType < ActiveRecord::Migration[5.0]
  def change
    add_column  :ocean_inspects, :pics, :string
  end
end
