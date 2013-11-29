module AssetsHelper

  def file_name(asset)
    if asset.file.url
      name = asset.file.url.split('/').last
      name.length > 10 ? name[0..10] + '..' : name
    end
  end

  def user_image_thumb_url(user)
    if @user.avatar.blank?
      "/assets/default_photo_thumb.jpg"
    else
      @user.avatar.url(:small_thumb)
    end
  end

  def user_image_url(user)
    if @user.avatar.blank?
      "/assets/default_photo.jpg"
    else
      @user.avatar.url(:thumb)
    end
  end
end
