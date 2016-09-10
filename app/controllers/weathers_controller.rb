class WeathersController < ApplicationController
  def index
    @monthly_reports = WeatherMonthly.last(30).reverse
  end

  def show
    @daily_reports = WeatherMonthly.find(params[:id]).weather_dailies
  end
end
