class AddCompositeTitleLevelIndexInTestTable < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %i[title level category_id], unique: true
  end
end
  