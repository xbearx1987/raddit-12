class ChangeDescriptionToUrlToLink < ActiveRecord::Migration[5.0]
  def change
    rename_column :links, :description, :url
  end
end
