class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.returns_array_of_titles_of_all_tests(category_name)
    joins(:category)
      .where(category: { title: category_name })
      .order(title: :desc).pluck(:title)
  end
end
