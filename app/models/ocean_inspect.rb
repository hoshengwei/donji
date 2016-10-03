class OceanInspect < ApplicationRecord
  mount_uploaders :pics, ImageUploader
  serialize :pics
end
