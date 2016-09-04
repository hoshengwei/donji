class CreateWeatherDailies < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_dailies do |t|
      t.integer :weather_monthly_id
      t.string :year
      t.string :month
      t.string :day
      t.string :time
      t.string :weather
      t.string :wdir
      t.string :wave
      t.string :wvdr
      t.string :wvpr
      t.string :ocean_temp
      t.string :temp
      t.string :wdsd
      t.string :wdlv
      t.string :humd
      t.string :pres
      t.string :rain
      t.timestamps
    end
  end
end
