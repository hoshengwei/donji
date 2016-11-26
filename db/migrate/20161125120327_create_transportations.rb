class CreateTransportations < ActiveRecord::Migration[5.0]
  def change
    create_table :transportations do |t|
      t.string :year
      t.string :month
      t.string :day
      t.string :status
      t.string :direction
      t.string :note
      t.integer :staff_id

      t.timestamps
    end
  end
end
