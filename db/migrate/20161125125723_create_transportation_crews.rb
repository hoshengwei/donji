class CreateTransportationCrews < ActiveRecord::Migration[5.0]
  def change
    create_table :transportation_crews do |t|
      t.integer :staff_id
      t.string :direction
      t.string :status
      t.belongs_to :transportation, foreign_key: true

      t.timestamps
    end
  end
end
