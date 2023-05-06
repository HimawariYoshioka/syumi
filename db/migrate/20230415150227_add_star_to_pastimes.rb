class AddStarToPastimes < ActiveRecord::Migration[6.1]
  def change
    add_column :pastimes, :star, :string
  end
end
