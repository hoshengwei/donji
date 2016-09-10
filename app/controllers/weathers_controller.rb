class WeathersController < ApplicationController
  def index
    @monthly_reports = WeatherMonthly.last(30).reverse
  end
end
