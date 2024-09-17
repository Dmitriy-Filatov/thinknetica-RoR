class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.belongs_to :category, foreign_key: true
      t.belongs_to(:author, { foreign_key: { to_table: :users }})


      t.timestamps
    end
  end
end
