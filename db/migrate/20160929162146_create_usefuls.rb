class CreateUsefuls < ActiveRecord::Migration[5.0]
  def change
    create_table :usefuls do |t|
      t.string :name
      t.string :catalog

      t.timestamps
    end
  end
end
