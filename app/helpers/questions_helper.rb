module QuestionsHelper
  ACTION = { edit: 'Edit Question in Test: ', create: 'Create New Question for Test: ' }.freeze

  def question_header(question)
    test_title = question.test.title
    @question.persisted? ? ACTION[:edit] + test_title : ACTION[:create] + test_title
  end
end
