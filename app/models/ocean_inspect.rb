class OceanInspect < ApplicationRecord

  before_save do
    if attribute_present?("crew")
      self.crew.gsub!(/[\[\]\"]/, "")
      self.crew[0] = ""
    end
    if attribute_present?("location")
      self.location.gsub!(/[\[\]\"]/, "")
      self.location[0] = ""
    end
    if attribute_present?("work_items")
      self.work_items.gsub!(/[\[\]\"]/, "")
      self.work_items[0] = ""
    end

    self.year = self.date.split("-")[0].to_i-1911
    self.month = self.date.split("-")[1]
    self.day = self.date.split("-")[2]

  end


  mount_uploaders :pics, ImageUploader
  serialize :pics
end
