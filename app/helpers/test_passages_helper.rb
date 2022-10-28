module TestPassagesHelper
  def result_message(test_passage)
    test_passage.success? ? t('.success') : t('.failure')
  end

  def green_red(test_passage)
    test_passage.success? ? 'greed' : 'red'
  end
end
