class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
  end
end

# def up
#  change_column_null(:tests, :title, false)
# Значение NULL не может быть использовано при сохранении данных в таблицу
# end

# def down
#  change_column_null(:tests, :title, true)
# Передаем true чтобы понимать, что ограничение надут убрать
# end

# Метод change_column_null есть в ActiveRecord::Migration::CommandRecorder
# Это значит, что его можно использовать внутри метода change,
# то есть код может выглядеть так
