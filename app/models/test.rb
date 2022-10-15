class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category#, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :created_tests, foreign_key: :author_id#, optional: true

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: {
    scope: %i[level category],
    case_sensitive: false,
    message: 'already exists'
  }

  scope :easy, -> { level(1) }
  scope :elementary, -> { where(level: 2) }
  scope :advanced, -> { where(level: 2) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
  scope :get_categories_by_title, ->(title) { joins(:category).where(category: { title: title }) }

  def self.titles_of_all_tests_by_category_title(title)
    get_categories_by_title(title).order(title: :desc).pluck(:title)
  end
end
