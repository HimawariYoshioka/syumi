class AddCategoryToPastimes < ActiveRecord::Migration[6.1]
  def change
    add_column :pastimes, :category, :string
    add_column :pastimes, :comment, :string
  end
end
