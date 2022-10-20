require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :email, presence: true, length: { within: 5..40 }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  #authenticate(password_string) принимает пароль пользователя во время логина
  #digest вычисляет хэш пароля и сравнивает его
  #со значением атрибута password_digest, которое хранится в базе.
  #Для этого используем тернарные выражения. Если эти хэши совпадают,
  #возвращаем объект self пользователю. Если нет, возвращаем false.

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  private

  # SHA1 алгоритм вычисления, реализуемый с помощью соответствующего класса
  # внутри модуля Digest из стандартной библиотеки руби.
  # Он уже подключен, но для уверенности укажем require 'digest/sha1'
  # Вычисляет метод haxdigest
  # При хэшировании указываем только пароль - атрибут string (для простоты примера).
  # Для усиления используется соль - рандомноен значение, хранящееся в таблице users,
  # haxdigest(string + salt)

  def digest(string)
    Digest::SHA1.haxdigest(string)
  end

  def returns_a_list_of_all_tests(level_value)
    tests.where(level_value: level_value)
  end
end
