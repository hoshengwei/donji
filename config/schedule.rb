# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
set :output, { error: 'log/cron_error.log' }
# Example:
#
every 1.hours do
  rake "get_weather:hourly"
  rake "get_weather:calc"
end

every 1.day, :at => '4:30 am' do
  rake "get_weather:tide"
end

every 1.day, :at => '4:00 pm' do
  rake "get_weather:update"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
