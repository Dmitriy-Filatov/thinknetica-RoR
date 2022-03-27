class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author_id, :integer
    add_belongs_to :tests, :users, column_name: :author_id, foreign_key: true
  end
end
