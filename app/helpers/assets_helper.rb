module AssetsHelper

  def file_name(asset)
    asset.file.url.split('/').last if asset.file.url
  end
end
