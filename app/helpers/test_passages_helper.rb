module TestPassagesHelper
  TEST_PASSAGE = {
    success: 'You have been completed Test successfully!',
    failure: 'You have been failed the Test!'
  }.freeze

  def result_message(test_passage)
    test_passage.success? ? TEST_PASSAGE[:success] : TEST_PASSAGE[:failure]
  end

  def success_failure(test_passage)
    test_passage.success? ? 'success' : 'failure'
  end

  def question_number(test_passage)
    "The Question #{test_passage.current_question_number} of #{test_passage.questions_count}."
  end
end
