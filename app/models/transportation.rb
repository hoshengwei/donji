class Transportation < ApplicationRecord
  has_many :transportationcrews, dependent: :destroy, inverse_of: :transportation

  accepts_nested_attributes_for :transportationcrews, reject_if: :all_blank, allow_destroy: true

  before_save do
    @date = self.date
    self.year = @date.split("-")[0].to_i-1911
    self.month = @date.split("-")[1]
    self.day = @date.split("-")[2]
  end

  after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new

  def set_defaults
    self.note  ||= '搭乘內太空號運補船'
    self.concat ||= "(06) 999-1112"
  end

end
