class OceanInspect < ApplicationRecord
  # relation ship for multi image upload
  has_many :attached_assets, dependent: :destroy
  # tell the model to accept the nested attributes for attached_assets
  accepts_nested_attributes_for :attached_assets, reject_if: :all_blank, allow_destroy: true
end
