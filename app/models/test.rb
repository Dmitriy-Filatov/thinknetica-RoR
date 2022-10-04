class Test < ApplicationRecord
  belongs_to :category#, optional: true
  belongs_to :author, foreign_key: :user_id, class_name: 'User'#, optional: true
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: {
    scope: %i[level category],
    case_sensitive: false,
    message: 'already exists'
  }

  scope :easy, -> { level(0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
  scope :get_categories_by_title, ->(title) { joins(:category).where(category: { title: title }) }

  def self.titles_of_all_tests_by_category_title(title)
    get_categories_by_title(title).order(title: :desc).pluck(:title)
  end
end
