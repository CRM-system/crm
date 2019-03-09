
Допустим("есть администратор") do
end

Если("он меняет имя сотрудника с {string} на {string}") do |current_name, new_name|
  worker_id = find_worker(current_name).id
  visit("admin/workers/#{worker_id}/edit")
  within('#new_worker') do
    fill_in('worker_nickname', with: new_name)
    fill_in('worker_email', with: "beric@mail.com")
    fill_in('worker_password', with: 'qweasd')
    click_button('Подтвердить')
  end
end

То("сотрудника Берик видно в списке сотрудников") do
  visit("admin/workers")
  find('td', text: 'Берик', match: :prefer_exact)
end

private

def find_worker(nickname)
  Worker.find_by(nickname: "#{nickname}")
end