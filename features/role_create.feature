# language: ru

Функционал: Создание новой должности
  Как администратор хочу создать новую должность

Сценарий: Создание должности
  Допустим логинится пользователь с email "admin@admin.com" и паролем "qweasd"
  Если он создает должность с названием "Оператор 2"
  То "Оператор 2" видно в списке должностей
