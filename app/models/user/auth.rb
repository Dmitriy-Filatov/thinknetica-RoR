# It maned so becouse Auth modul will be include inside User class
# It can not be maned Auth::User

module User::Auth

  extend ActiveSupport::Concern

  # Это виртуальные атрибуты.
  # Они вводятся, так как эти данные должны быть в объекта класса User,
  # но нет необходимости хранить их в БД.

  attr_reader :password
  attr_writer :password_confimation
 
  included do
    validates :email, presence: true, length: { within: 5..40 }
    validates :password, presence: true, if: proc { |current_user| current_user.password_digest.blank? }
    validates :password, confirmation: true
  end

  # authenticate(password_string) принимает пароль пользователя во время логина
  # digest вычисляет хэш пароля и сравнивает его
  # со значением атрибута password_digest, которое хранится в базе.
  # Для этого используем тернарные выражения. Если эти хэши совпадают,
  # возвращаем объект self пользователю. Если нет, возвращаем false.

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  # При вызове метода устанавливаем переменную экземпляра @password,
  # в которую поступает значие пароля модели User.
  # И вычислить значение хэша password_digest с помощью метода digest.
  # Этот хэш установит в атрибут модели с помощью метода self.
  # Это хначение при сохранении модели будет записано в БД
  # (в соответствующую колонку внутри таблицы)
  # self используется, для установления атрибута модели (а не локальной переменной).

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
    @password = password_string
    self.password_digest = digest(password_string)
    end
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
    Digest::SHA1.hexdigest(string)
  end
end
