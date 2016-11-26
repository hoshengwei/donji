class AddIdNumberToCrew < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :id_number, :string
  end
end
