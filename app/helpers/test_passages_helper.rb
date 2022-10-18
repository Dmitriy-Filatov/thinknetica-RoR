module TestPassagesHelper
  def result_color_and_percent_message(result_percent)
    if @test_passage.success?
      "<h2 style='color: green'>You answered #{result_percent}% questions.
      The Test passed successfully!</h2>".html_safe
    else
      "<h2 style='color: red'>You answered #{result_percent}% questions.
      The Test failed!</h2>".html_safe
    end
  end

  def question_number(test_passage)
    "The Question #{test_passage.current_question_number} of #{test_passage.questions_count}."
  end
end
