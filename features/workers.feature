# language: ru


Функционал: создание нового сотрудника, редактирование данных сотрудника, удаление
  Как администратор
  Я хочу зайти на страницу всех сотрудников.
  Создать нового сотрудника.
  Отредактировать данные сотрудника.
  Удалить данные сотрудника.

  Сценарий: создание сотрудника
    Допустим залогиненный пользователь с email "admin@admin.com" и паролем "qweasd"
    Если он создаёт сотрудника с данными: имя "Серик" email "serik@gmail.com" паролем "qweasd"
    То сотрудника Серик видно в списке сотрудников

