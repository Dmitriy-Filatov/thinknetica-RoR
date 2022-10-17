class Test < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: {
    scope: %i[level category],
    case_sensitive: false,
    message: 'already exists'
  }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { where(level: 1) }
  scope :elementary, -> { where(level: 2) }
  scope :advanced, -> { where(level: 2) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }
  scope :get_categories_by_title, ->(title) { joins(:category).where(category: { title: title }) }

  def self.titles_of_all_tests_by_category_title(title)
    get_categories_by_title(title).order(title: :desc).pluck(:title)
  end
end
