# encoding: utf-8

class ProfilePhotoUploaderUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :thumb do
    process resize_to_limit: [30, 30]
  end

  version :preview do
    process resize_to_limit: [60, 60]
  end

  version :large do
    process resize_to_limit: [150, 150]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def image?
    image_ext = %w(jpg jpeg gif png)
    if file.respond_to?(:extension)
      image_ext.include?(file.extension.downcase)
    else
      # Not all Carrierwave storages respond to :extension
      ext = file.path.split('.').last.downcase
      image_ext.include?(ext)
    end
  rescue
    false
  end

  def file_storage?
    self.class.storage == CarrierWave::Storage::File
  end

end
