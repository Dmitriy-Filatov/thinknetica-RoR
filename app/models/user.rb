class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :gists, dependent: :destroy

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def returns_a_list_of_all_tests(level_value)
    tests.where(level_value: level_value)
  end

  def admin?
    is_a?(Admin)
  end
end
