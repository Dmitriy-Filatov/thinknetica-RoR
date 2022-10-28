module QuestionsHelper
  QUESTION_ACTION = { edit: 'Edit Question in Test: ', create: 'Create New Question for Test: ' }.freeze

  def question_header(question)
    test_title = question.test.title
    @question.persisted? ? QUESTION_ACTION[:edit] + test_title : QUESTION_ACTION[:create] + test_title
  end
end
