class AddImageToPastimes < ActiveRecord::Migration[6.1]
  def change
    add_column :pastimes, :image, :string
  end
end
