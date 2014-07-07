class ThumbnailUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    '/thumbnail_uploads'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/thumbnail_uploads/default.jpg"
  end


end