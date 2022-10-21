class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :email, :string, limit: 40, null: false)
  end
end
