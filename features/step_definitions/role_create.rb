Допустим("логинится пользователь с email {string} и паролем {string}") do |email, password|
  visit('/workers/sign_in')

  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  visit('admin/orders')
end

Если("он создает должность с названием {string}") do |name|
  visit('admin/roles/new')

  within('.fields form') do
    fill_in('Название', with: name)
    click_button('Подтвердить')
  end
end

То("{string} видно в списке должностей") do |title|
  visit('admin/roles')

  expect(page).to have_text "#{title}"
end
