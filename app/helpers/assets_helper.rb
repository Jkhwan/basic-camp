module AssetsHelper

  def file_name(asset)
    if asset.file.url
      name = asset.file.url.split('/').last
      name.length > 10 ? name[0..10] + '..' : name
    end
  end
end
