class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true, length: { within: 5..40 }

  def returns_a_list_of_all_tests(level_value)
    tests.where(level_value: level_value)
  end
end
  
