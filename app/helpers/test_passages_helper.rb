module TestPassagesHelper
  TEST_PASSAGE = {
    success: 'The Test was passed successfully!',
    failure: 'The Test failed!'
  }.freeze

  def result_message(test_passage)
    test_passage.success? ? TEST_PASSAGE[:success] : TEST_PASSAGE[:failure]
  end

  def question_number(test_passage)
    "The Question #{test_passage.current_question_number} of #{test_passage.questions_count}."
  end
end
