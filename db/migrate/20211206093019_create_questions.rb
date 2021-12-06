class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.belongs_to :tests, foreign_key: true

      t.timestamps
    end
  end
end