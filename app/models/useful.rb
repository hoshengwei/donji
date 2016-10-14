class Useful < ApplicationRecord
  validates :name, presence: true
  validates :catalog, presence: true
end
