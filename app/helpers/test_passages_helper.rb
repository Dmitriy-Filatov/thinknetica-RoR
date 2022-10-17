module TestPassagesHelper
  def result_message
    if test_passage.success?
      'The Test was passed successfully!'
    else
      'The Test failed!'
    end
  end

  def green_or_red!
    @test_passage.success? ? 'success' : 'failure'
  end

  def question_number(test_passage)
    "The Question #{test_passage.current_question_number} of #{test_passage.questions_count}."
  end
end
