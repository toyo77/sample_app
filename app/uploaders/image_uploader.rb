# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  #include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  # Choose what kind of storage to use for this uploader:
  #storage :file
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.id}"
  end

  def cache_dir
    "tmp/uploads/cache/#{model.id}"
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  # 画像の上限を700pxにする
  process :resize_to_limit => [700, 700]
  # def scale(width, height)
  #   # do something
  # end
  
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  
  # 保存形式をJPGにする
  process :convert => 'jpg'
  # Create different versions of your uploaded files:
   version :thumb do
     process :resize_to_fit => [500, 300]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
   %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
   def filename
     super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
   end


end
