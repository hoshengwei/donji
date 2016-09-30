class OceanInspect < ApplicationRecord
  has_attached_file :img, styles: { large: "600x600>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
