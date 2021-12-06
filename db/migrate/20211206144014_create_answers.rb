class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.belongs_to :questions, foreign_key: true

      t.timestamps
    end
  end
end
