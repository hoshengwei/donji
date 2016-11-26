class AdjustColumnOfTransportation < ActiveRecord::Migration[5.0]
  def change
    add_column :transportations, :date, :string
    remove_column :transportations, :status, :string
    remove_column :transportations, :direction, :string
    remove_column :transportations, :staff_id, :integer
    add_column :transportations, :concat, :string
  end
end
