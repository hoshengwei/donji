class Staff < ApplicationRecord
  has_many :transportation_crews
  validates :name, presence: true
  validates :role, presence: true
end
