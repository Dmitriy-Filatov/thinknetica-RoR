class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tests, :user, foreign_key: true
  end
end
