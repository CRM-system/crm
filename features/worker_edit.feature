# language: ru


Функционал: редактирование данных сотрудника
  Как администратор
  Я хочу зайти на страницу всех сотрудников.
  Отредактировать сотрудника.

  Сценарий: редактирование сотрудника
    Допустим есть администратор
    И логинится пользователь с email "admin@admin.com" и паролем "qweasd"
    Если он создаёт сотрудника с данными: имя "Серик" email "serik@gmail.com" паролем "qweasd"
    То сотрудника Серик видно в списке сотрудников
    # Если есть сотрудник с данными: имя "Серик" email "serik@gmail.com" паролем "qweasd"
    Если админ изменит данные сотрудника Серик на Берик
    То сотрудника Берик видно в списке сотрудников