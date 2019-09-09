namespace :todos do
  desc "Auto Schedule ToDo"
  task iguard_schedule: :environment do
    User.all.each do |user|
      CameraSetting.where(user_id: user.id).all.each do |cam|
        if Time.now.to_s(:time) == cam.off_time
          cam.status = "Off"
          cam.save
        end
        if Time.now.to_s(:time) == cam.on_time
          cam.status = "On"
          cam.save
        end
      end
    end
  end
end
