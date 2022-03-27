# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: 'Публичные мероприятия' },
  { title: 'Экстремизм' },
  { title: 'Терроризм' }
])

users = User.create!([{ name: 'Имя'}])

tests = Test.create!([
  { title: 'Основные понятия', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Основные понятия', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Основные понятия', level: 1, category_id: categories[2].id, author_id: users[0].id }
])

questions = Question.create!([
  { body: 'Какие формы публичных мероприятий предусмотрены 54-ФЗ?', test_id: tests[0].id },
  { body: 'Что входит в основные понятия 114-ФЗ?', test_id: tests[1].id },
  { body: 'Что входит в основные понятия 35-ФЗ?', test_id: tests[2].id }
])

answers = Answer.create!([
  { body: 'митинг, демонстрация, шествие, пикетирование', correct: true, question_id: questions[0].id },
  { body: 'общее собрание жителей мкд', correct: false, question_id: questions[0].id },
  { body: 'экстремизм, экстремистская организация, экстремистские материалы,
          символика экстремистской организации', correct: true, question_id: questions[1].id },
  { body: 'преступное сообщество', correct: false, question_id: questions[1].id },
  { body: 'терроризм,террористическая деятельность, террористический акт,
          противодействие терроризму, контртеррористическая операция,
          антитеррористическая защищенность объекта', correct: true, question_id: questions[2].id },
  { body: 'организованная преступная группа', correct: false, question_id: questions[2].id }
])
