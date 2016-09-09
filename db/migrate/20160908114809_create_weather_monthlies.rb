class CreateWeatherMonthlies < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_monthlies do |t|
      t.string :year
      t.string :month
      t.string :day
      t.string :weather
      t.string :temp
      t.string :t_min
      t.string :t_max
      t.string :wave
      t.string :rain
      t.string :rain_hour
      t.string :sun_rate
      t.string :sun_hour
      t.string :wdir
      t.string :wdsd
      t.string :wdlv
      t.string :wd_max
      t.string :humd
      t.string :pres
      t.string :visb
      t.string :status
      t.string :tide
      t.string :ocean_temp
      t.timestamps
    end
  end
end
