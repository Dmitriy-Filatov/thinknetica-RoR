class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validates :validate_max_limit_answers, on: %i[create update]

  def validate_max_limit_answers
    errors.add(:question, 'limit is exceeded') unless question.answers.count < 4
  end
end
