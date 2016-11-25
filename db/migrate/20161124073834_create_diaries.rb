class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.text :item
      t.belongs_to :ocean_inspect, index: true

      t.timestamps
    end
  end
end
