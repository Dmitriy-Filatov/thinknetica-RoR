class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :get_categories_by_title, ->(title) { joins(:category).where(category: { title: title }).order(title: :desc).pluck(:title) }

  def self.returns_array_of_titles_of_all_tests_by_category_title(title)
    get_categories_by_title(title)
  end
end
