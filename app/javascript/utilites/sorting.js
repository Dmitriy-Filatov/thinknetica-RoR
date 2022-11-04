// у всего документа во время обработки события - 'turbolinks:load' - вызываем function, в тот момент, когда данное событие наступит
document.addEventListener('turbolinks:load', function() {
  // объявим локальную переменную 'control' и присвоим в нее элемент, у которого CSS-класс 'sort-by-title'
  var control = document.querySelector('.sort-by-title')
  // при событии 'click'
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  // находим первый html-элемент в document с тегом 'table'
  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc) // работает как оператор <=> в ruby
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDecs)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')

  // вызываем у таблицы метод, который возвращает коллекцию CSS-классов и добавляем CSS-класс 'table'
  sortedTable.classList.add('table')
  // с помощью appendChild включаем заголовок в новую таблицу (объект пока что только в памяти, а не в DOM)
  sortedTable.appendChild(rows[0])

  // проходим по отсортированным строкам и добавляем каждый элемент в таблицу (в памяти)
  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  // у текущей таблицы ищем "родительский узел" -> меняем таблицы местами --->>> Единственная физическая вставка в объектную модель документа (DOM)
  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDecs(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}

// Ячейка 'sort-by-title' это физический элемент, который изначально присутствовал в DOM-дереве -> затем мы его получили в списке всех строчек таблицы в локальной переменной 'rows' -> затем этот же самый html-элемент добавили в новую таблицу 'sortedTable' -> новую таблицу вставили в DOM-дерево (единственная физическая вставка) в конце функции сортировки 'sortRowsByTitle' с помощью 'replaceChild'

// Поскольку мы на протяжении всего цикла работали с физическим элеменом, который у нас был изначально + на котором висело СОБЫТИЕ 'click', то это СОБЫТИЕ осталось --->>> Из-за того, что это тот же самый элемент, то и ОБРАБОТЧИК СОБЫТИЙ, который на нем был -> остался!

// Но если бы мы создали НОВУЮ строчку с заголовком через 'createElement', то она была бы пустым элементом (без контента, ячеек таблицы и НЕ было бы обработчика события 'click')
