class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, case_sensitive: false, message: 'already exists' }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
  scope :get_categories_by_title, ->(title) { joins(:category).where(category: { title: title }).order(title: :desc) }

  def self.returns_array_of_titles_of_all_tests_by_category_title(title)
    get_categories_by_title(title).pluck(:title)
  end
end
