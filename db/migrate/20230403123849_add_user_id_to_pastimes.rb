class AddUserIdToPastimes < ActiveRecord::Migration[6.1]
  def change
    add_column :pastimes, :user_id, :integer
  end
end
