class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author_id, :integer
  end
end
