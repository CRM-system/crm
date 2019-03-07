
Допустим("залогиненный пользователь с email {string} и паролем {string}") do |email, password|
  visit("workers/sign_in")
  fill_in('Email', with: email)
  fill_in('Password', with: 'qweasd')
  click_button('Log in')
  expect('admin/orders')
end

Если("он создаёт сотрудника с данными: имя {string} email {string} паролем {string}") do |nickname, email, password|
  visit("admin/workers/new")
  within('#new_worker') do
    fill_in('worker_nickname', with: nickname)
    fill_in('worker_email', with: email)
    fill_in('worker_password', with: password)
    select('Оператор', from: 'worker_role_id')
    click_button('Подтвердить')
  end
end

То("сотрудника Серик видно в списке сотрудников") do
  visit("admin/workers")
  find('td', text: 'Серик', match: :prefer_exact)
end
