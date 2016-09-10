class WeatherMonthly < ApplicationRecord
  has_many :weather_dailies, dependent: :destroy

end
