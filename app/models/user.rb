class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true, length: { within: 5..40 }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def returns_a_list_of_all_tests(level_value)
    tests.where(level_value: level_value)
  end
end
