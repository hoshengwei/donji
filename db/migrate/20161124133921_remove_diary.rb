class RemoveDiary < ActiveRecord::Migration[5.0]
  def change
    remove_column  :ocean_inspects, :diary, :text
  end
end
