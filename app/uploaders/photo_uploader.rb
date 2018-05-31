class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def content_type_whitelist
    /image\//
end
def extension_whitelist
  %w(jpg jpeg gif png)
end
end
