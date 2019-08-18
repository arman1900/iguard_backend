class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave


  process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    process :resize_to_fill => [800, 500, :north]
  end

  version :thumbnail do
    process :resize_to_fill => [150, 100, :north]
  end
end
