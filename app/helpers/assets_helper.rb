module AssetsHelper

  def file_name(asset)
    name = asset.file.url.split('/').last if asset.file.url
    name.length > 10 ? name[0..10] + '..' : name
  end
end
