class AttachedAsset < ApplicationRecord
  # relationship
  belongs_to :ocean_inspect
  # paperclip setting
  has_attached_file :asset, styles: { large: "600x600>" }
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\z/
  # do_not_validate_attachment_file_type :asset

end
