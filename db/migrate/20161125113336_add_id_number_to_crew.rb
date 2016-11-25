class AddIdNumberToCrew < ActiveRecord::Migration[5.0]
  def change
    remove_column  :ocean_inspects, :diary, :text
    add_column :staffs, :id_number, :string
  end
end
