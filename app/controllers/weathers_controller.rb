class WeathersController < ApplicationController
  def index
    @monthly_reports = WeatherMonthly.last(30).reverse
  end

  def show
    @daily_reports = WeatherMonthly.find(params[:id]).weather_dailies
  end

  def cwb
    @dateng = params[:date]
    @data = @dateng.to_s.split("-")
    @date = (@data[0].to_i - 1911).to_s + @data[1] + @data[2]
    system "bin/rake get_weather:cwb[#{@date}]"
    redirect_to weathers_path
  end
end
