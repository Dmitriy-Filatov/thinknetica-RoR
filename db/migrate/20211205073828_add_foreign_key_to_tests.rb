class AddForeignKeyToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :category, :integer
  end
end
