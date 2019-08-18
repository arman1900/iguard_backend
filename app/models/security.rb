class Security < ApplicationRecord
    mount_uploader :picture, PictureUploader
    has_and_belongs_to_many :users
end
