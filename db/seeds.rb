# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Иван', email: 'ivan@durak.su' }])

categories = Category.create!([
  { title: 'Публичные мероприятия' },
  { title: 'Экстремизм' },
  { title: 'Терроризм' }
])

tests = Test.create!([
  { title: 'Основные понятия 54-ФЗ', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Организация и проведение публичного мероприятия', level: 2, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Организатор публичного мероприятия', level: 3, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Участники публичного мероприятия', level: 4, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Основные понятия 114-ФЗ', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Основные принципы противодействия', level: 2, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Основные направления противодействия', level: 3, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Религиозные тексты', level: 4, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Основные понятия 35-ФЗ', level: 1, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Основные принципы противодействия терроризму', level: 2, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Организационные основы противодействия терроризму', level: 3, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Полномочиям органов исполнительной власти субъектов РФ', level: 4, category_id: categories[2].id, author_id: users[0].id },
])

questions = Question.create!([
  { body: 'Какие формы публичных мероприятий предусмотрены 54-ФЗ?', test_id: tests[0].id },
  { body: 'К организации публичного мероприятия относятся:', test_id: tests[1].id },
  { body: 'Организатором публичного мероприятия не может быть:', test_id: tests[2].id },
  { body: 'Кто признается участником публичного мероприятия?', test_id: tests[3].id },
  { body: 'Что входит в основные поняти 114-ФЗ ?', test_id: tests[4].id },
  { body: 'Какие принципы относятся к противодействию экстремистской деятельности?', test_id: tests[5].id },
  { body: 'Какие направления относятся к противодействию экстремистской деятельности?', test_id: tests[6].id },
  { body: 'Какие собенности применения закона в отношении религиозных текстов?', test_id: tests[7].id },
  { body: 'Что входит в основные понятия 35-ФЗ?', test_id: tests[8].id },
  { body: 'Какие принципы относятся к противодействию терроризму?', test_id: tests[9].id },
  { body: 'Что относится к функциям Президента РФ?', test_id: tests[10].id },
  { body: 'Что относится к полномочиям органов власти субъектов РФ', test_id: tests[11].id }
])

test_passages = TestPassage.create!([
  { test: tests[0], user: users[0], current_question: tests[0].questions[0] },
  { test: tests[1], user: users[0], current_question: tests[1].questions[1] },
  { test: tests[2], user: users[0], current_question: tests[2].questions[2] }
])

  Answer.create!([
  { body: 'митинг, демонстрация, шествие, пикетирование', correct: true, question_id: questions[0].id },
  { body: 'общее собрание жителей мкд', correct: false, question_id: questions[0].id },
  { body: 'оповещение возможных участников', correct: true, question_id: questions[1].id },
  { body: 'торги', correct: false, question_id: questions[1].id },
  { body: 'запрещенная политическая партия', correct: true, question_id: questions[2].id },
  { body: 'гражданин РФ в возрасте до 18 лет ', correct: false, question_id: questions[2].id },
  { body: 'добровольно участвующие граждане', correct: true, question_id: questions[3].id },
  { body: 'лица без гражданства', correct: false, question_id: questions[3].id },
  { body: 'экстремизм', correct: true, question_id: questions[4].id },
  { body: 'преступное сообщество', correct: false, question_id: questions[4].id },
  { body: 'приоритет обеспечения безопасности РФ', correct: true, question_id: questions[5].id },
  { body: 'государственная измена', correct: false, question_id: questions[5].id },
  { body: 'профилактические меры', correct: true, question_id: questions[6].id },
  { body: 'крайняя необходимость', correct: false, question_id: questions[6].id },
  { body: 'Библия не может быть признана экстремистским материалом', correct: true, question_id: questions[7].id },
  { body: 'цитаты из Корана могут быть признаны экстремистскими материалами', correct: false, question_id: questions[7].id },
  { body: 'терроризм', correct: true, question_id: questions[8].id },
  { body: 'организованная преступная группа', correct: false, question_id: questions[8].id },
  { body: 'недопустимость политических уступок', correct: true, question_id: questions[9].id },
  { body: 'состязательность сторон', correct: false, question_id: questions[9].id },
  { body: 'направляет госполитику противодействия', correct: true, question_id: questions[10].id },
  { body: 'необходимая самооборона', correct: false, question_id: questions[10].id },
  { body: 'оргнанизация реализации госполитики противодействия', correct: true, question_id: questions[11].id },
  { body: 'контрпротиводействие терроризму', correct: false, question_id: questions[11].id }
])
