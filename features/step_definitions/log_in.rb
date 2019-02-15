Допустим("Заходим на страницу авторизации") do
  visit('/workers/sign_in')
end

Если("залогинен пользователь с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end
end

То("происходит переход на страницу {string}") do |url|
  expect(page).to have_current_path(url)
end

Если("пытаемся залогиниться с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end
end

То("мы остаемся на странице {string}") do |url|
  expect(page).to have_current_path(url)
end
