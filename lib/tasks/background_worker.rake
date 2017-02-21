namespace :background_worker do
  desc "TODO"
  task run: :environment do
    BackgroundWorker.new.work
  end

end
