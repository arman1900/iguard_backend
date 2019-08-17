class Security < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
