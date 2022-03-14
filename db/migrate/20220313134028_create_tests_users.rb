class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users do |t|
      t.integer :test_id, index: true, null: false
      t.integer :user_id, index: true, null: false

      t.timestamps
    end
  end
end
