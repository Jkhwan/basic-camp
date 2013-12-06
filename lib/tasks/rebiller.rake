namespace :rebiller do
  task :run => :environment do
    Tasks::DailyRebiller.new.run
  end
end