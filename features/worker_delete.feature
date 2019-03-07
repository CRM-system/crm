# language: ru

Функционал: Удаление сотрудника
  Как администратор хочу удалить сотрудника

Сценарий: Удаление сотрудника
  Допустим залогиненный пользователь с email "admin@admin.com" и паролем "qweasd"
  Если он создаёт сотрудника с данными: имя "Серик" email "serik@gmail.com" паролем "qweasd"
  И сотрудника Серик видно в списке сотрудников
  Если он удаляет сотрудника с именем "Серик"
  То сотрудника "Серик" не видно в списке сотрудников
