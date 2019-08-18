class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    process resize_to_fit: [600, 800]
  end

  version :thumbnail do
    resize_to_fit(100, 150)
  end

end
