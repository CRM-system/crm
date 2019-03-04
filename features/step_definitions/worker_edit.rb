
Допустим("есть администратор") do
end

Если("админ изменит данные сотрудника Серик на Берик") do
  visit('admin/workers/4/edit')
  within('#new_worker') do
    fill_in('worker_nickname', with: "Берик")
    fill_in('worker_email', with: "beric@mail.com")
    fill_in('worker_password', with: 'qweasd')
    click_button('Подтвердить')
  end
end

То("сотрудника Берик видно в списке сотрудников") do
  visit("admin/workers")
  find('td', text: 'Берик', match: :prefer_exact)
end