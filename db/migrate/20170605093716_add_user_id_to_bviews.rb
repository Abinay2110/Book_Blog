class AddUserIdToBviews < ActiveRecord::Migration[5.0]
  def change
    add_column :bviews, :user_id, :integer
  end
end
