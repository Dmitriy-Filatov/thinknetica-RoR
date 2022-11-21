# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test, touch: true
  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: 'current_question_id', dependent: :nullify
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
