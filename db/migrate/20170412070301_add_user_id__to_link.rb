class AddUserIdToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :user_id, :integer
  end
end
