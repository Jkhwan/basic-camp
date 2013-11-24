class RemoveAvatarFromAssets < ActiveRecord::Migration
  def change
    remove_column :assets, :avatar, :string
  end
end
