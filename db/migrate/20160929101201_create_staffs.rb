class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :title
      t.string :role
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
