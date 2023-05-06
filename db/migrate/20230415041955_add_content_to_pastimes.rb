class AddContentToPastimes < ActiveRecord::Migration[6.1]
  def change
    add_column :pastimes, :content, :string
  end
end
