class Boat < ApplicationRecord
  validates :name, presence: true
  validates :fuelConsumption, presence: true
end
