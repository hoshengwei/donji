class OceanInspect < ApplicationRecord

  before_save do
    if attribute_present?("crew")
      self.crew.gsub!(/[\[\]\"]/, "")
      self.crew[0] = ""
      self.crew.gsub!(/,/, " 、")
    end
    if attribute_present?("location")
      self.location.gsub!(/[\[\]\"]/, "")
      self.location[0] = ""
      self.location.gsub!(/,/, " 、")
    end
    if attribute_present?("work_items")
      self.work_items.gsub!(/[\[\]\"]/, "")
      self.work_items[0] = ""
      self.work_items.gsub!(/,/, " 、")
    end
    @date = self.date
    self.year = @date.split("-")[0].to_i-1911
    self.month = @date.split("-")[1]
    self.day = @date.split("-")[2]

  end


  mount_uploaders :pics, ImageUploader
  serialize :pics

  # Validation
  validates :date, presence: true
  validates :s_time, presence: true
  validates :e_time, presence: true
  validates :boat_id, presence: true
  validates :captain, presence: true
  validates :distance, presence: true
  validates :leader, presence: true

  

end
