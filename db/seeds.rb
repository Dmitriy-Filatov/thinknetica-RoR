# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alonge the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Иван', email: 'ivan@durak.su', password: 'mypassword' }])

categories = Category.create!([
  { title: 'Публичные мероприятия' },
  { title: 'Экстремизм' },
  { title: 'Терроризм' }
])

tests = Test.create!([
  { title: 'Основные понятия 54-ФЗ', level: 1, category: categories[0], author: users[0] },
  { title: 'Организация и проведение публичного мероприятия', level: 2, category: categories[0], author: users[0] },
  { title: 'Организатор публичного мероприятия', level: 3, category: categories[0], author: users[0] },
  { title: 'Участники публичного мероприятия', level: 4, category: categories[0], author: users[0] },
  { title: 'Основные понятия 114-ФЗ', level: 1, category: categories[1], author: users[0] },
  { title: 'Основные принципы противодействия', level: 2, category: categories[1], author: users[0] },
  { title: 'Основные направления противодействия', level: 3, category: categories[1], author: users[0] },
  { title: 'Религиозные тексты', level: 4, category: categories[1], author: users[0] },
  { title: 'Основные понятия 35-ФЗ', level: 1, category: categories[2], author: users[0] },
  { title: 'Основные принципы противодействия терроризму', level: 2, category: categories[2], author: users[0] },
  { title: 'Организационные основы противодействия терроризму', level: 3, category: categories[2], author: users[0] },
  { title: 'Полномочиям органов исполнительной власти субъектов РФ', level: 4, category: categories[2], author: users[0] },
])

questions = Question.create!([
  { body: 'Какие формы публичных мероприятий предусмотрены 54-ФЗ?', test: tests[0] },
  { body: 'К организации публичного мероприятия относятся:', test: tests[1] },
  { body: 'Организатором публичного мероприятия не может быть:', test: tests[2] },
  { body: 'Кто признается участником публичного мероприятия?', test: tests[3] },
  { body: 'Что входит в основные поняти 114-ФЗ ?', test: tests[4] },
  { body: 'Какие принципы относятся к противодействию экстремистской деятельности?', test: tests[5] },
  { body: 'Какие направления относятся к противодействию экстремистской деятельности?', test: tests[6] },
  { body: 'Какие собенности применения закона в отношении религиозных текстов?', test: tests[7] },
  { body: 'Что входит в основные понятия 35-ФЗ?', test: tests[8] },
  { body: 'Какие принципы относятся к противодействию терроризму?', test: tests[9] },
  { body: 'Что относится к функциям Президента РФ?', test: tests[10] },
  { body: 'Что относится к полномочиям органов власти субъектов РФ', test: tests[11] }
])

test_passages = TestPassage.create!([
  { test: tests[0], user: users[0], current_question: tests[0].questions[0] },
  { test: tests[1], user: users[0], current_question: tests[1].questions[1] },
  { test: tests[2], user: users[0], current_question: tests[2].questions[2] }
])

  Answer.create!([
  { body: 'митинг, демонстрация, шествие, пикетирование', correct: true, question: questions[0] },
  { body: 'общее собрание жителей мкд', correct: false, question: questions[0] },
  { body: 'оповещение возможных участников', correct: true, question: questions[1] },
  { body: 'торги', correct: false, question: questions[1] },
  { body: 'запрещенная политическая партия', correct: true, question: questions[2] },
  { body: 'гражданин РФ в возрасте до 18 лет ', correct: false, question: questions[2] },
  { body: 'добровольно участвующие граждане', correct: true, question: questions[3] },
  { body: 'лица без гражданства', correct: false, question: questions[3] },
  { body: 'экстремизм', correct: true, question: questions[4] },
  { body: 'преступное сообщество', correct: false, question: questions[4] },
  { body: 'приоритет обеспечения безопасности РФ', correct: true, question: questions[5] },
  { body: 'государственная измена', correct: false, question: questions[5] },
  { body: 'профилактические меры', correct: true, question: questions[6] },
  { body: 'крайняя необходимость', correct: false, question: questions[6] },
  { body: 'Библия не может быть признана экстремистским материалом', correct: true, question: questions[7] },
  { body: 'цитаты из Корана могут быть признаны экстремистскими материалами', correct: false, question: questions[7] },
  { body: 'терроризм', correct: true, question: questions[8] },
  { body: 'организованная преступная группа', correct: false, question: questions[8] },
  { body: 'недопустимость политических уступок', correct: true, question: questions[9] },
  { body: 'состязательность сторон', correct: false, question: questions[9] },
  { body: 'направляет госполитику противодействия', correct: true, question: questions[10] },
  { body: 'необходимая самооборона', correct: false, question: questions[10] },
  { body: 'оргнанизация реализации госполитики противодействия', correct: true, question: questions[11] },
  { body: 'контрпротиводействие терроризму', correct: false, question: questions[11] }
])
