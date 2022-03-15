class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users do |t|
      t.integer :test_id, index: true, null: false
      t.integer :user_id, index: true, null: false
      t.belongs_to :test, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
