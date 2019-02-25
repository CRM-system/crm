Если("есть сотрудник с данными: имя {string} email {string} паролем {string}") do |string, string2, string3|
  create(:worker)
end

Если("админ изменит данные сотрудника Серик на Берик") do
  visit('admin/workers/1/edit')
  within('#admin/workers/1') do
    fill_in('worker_nickname', with: 'Берик')
    select('Оператор', from: 'worker_role_id')
    click_button('Подтвердить')
  end

  sleep(5)
end

То("сотрудника Берик видно в списке сотрудников") do
  visit("admin/workers")
  find('td', text: 'Берик', match: :prefer_exact) # Write code here that turns the phrase above into concrete actions
end
