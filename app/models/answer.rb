class Answer < ApplicationRecord
  belongs_to(:question)

  validates(:body, presence: true)
  validate(:validate_max_limit_answers, { on: %i[create update] })

  scope(:correct, -> { where(correct: true) })

  def validate_max_limit_answers
    errors.add(:question, 'limit is exceeded') if question.answers.count > 4
  end
end
