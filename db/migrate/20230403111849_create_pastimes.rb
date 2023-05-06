class CreatePastimes < ActiveRecord::Migration[6.1]
  def change
    create_table :pastimes do |t|
      t.string :genre
      t.string :hobby
      t.string :time
      t.string :price
      t.string :number

      t.timestamps
    end
  end
end
