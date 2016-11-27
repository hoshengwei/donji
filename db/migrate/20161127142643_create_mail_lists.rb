class CreateMailLists < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_lists do |t|
      t.string :address

      t.timestamps
    end
  end
end
