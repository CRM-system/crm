# language: ru

Функционал: Редактирование должности
  Как администратор хочу редактировать должность

Сценарий: Редактирование должности
  Допустим логинится пользователь с email "admin@admin.com" и паролем "qweasd"
    И создает должность с названием "Абвгд 2"
  Если он меняет название должности с "Абвгд 2" на "Абвгд 2 ред."
  То при переходе на страницу списка должностей будет видно данную должность "Абвгд 2 ред."
