class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :limits_the_range_of_answers, on: %i[create update]

  def limits_the_range_of_answers
    errors.add(:question, "too many answers") if question.answers.count >= 4
  end
end
