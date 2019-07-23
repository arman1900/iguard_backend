class Notification < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
