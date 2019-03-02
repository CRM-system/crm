
Допустим("есть администратор") do
  create(:worker)
end

Если("есть сотрудник с данными: имя {string} email {string} паролем {string}") do |string, string2, string3|
  pending # Write code here that turns the phrase above into concrete actions
end

Если("админ изменит данные сотрудника Серик на Берик") do
  pending # Write code here that turns the phrase above into concrete actions
end

То("сотрудника Берик видно в списке сотрудников") do
  pending # Write code here that turns the phrase above into concrete actions
end