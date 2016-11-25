class OceanInspect < ApplicationRecord
  has_many :diaries, dependent: :destroy, inverse_of: :ocean_inspect
  accepts_nested_attributes_for :diaries, reject_if: :all_blank, allow_destroy: true

  before_save do
    wday_i = self.date.to_date.wday.to_i
    @wday = "日" if wday_i === 0
    @wday = "一" if wday_i === 1
    @wday = "二" if wday_i === 2
    @wday = "三" if wday_i === 3
    @wday = "四" if wday_i === 4
    @wday = "五" if wday_i === 5
    @wday = "六" if wday_i === 6
    self.wday = @wday

    self.gas_consumption = self.distance.to_f * Boat.find(self.boat_id).fuelConsumption.to_f

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


  mount_uploader :pics, ImageUploader
  mount_uploader :map, ImageUploader

  # Validation
  validates :date, presence: true
  validates :s_time, presence: true
  validates :e_time, presence: true
  validates :boat_id, presence: true
  validates :captain, presence: true
  validates :distance, presence: true
  validates :leader, presence: true
end
