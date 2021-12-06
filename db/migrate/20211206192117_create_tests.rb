class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.belongs_to :categories, foreign_key: true

      t.timestamps
    end
  end
end
