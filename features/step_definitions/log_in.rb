Допустим("Админ заходит на страницу авторизации") do
  visit('/workers/sign_in')
end

Если("залогинен админ с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  sleep(2)
end

То("админа переносят на страницу {string}") do |url|
  expect(page).to have_current_path(url)
end


Допустим("Оператор заходит на страницу авторизации") do
  visit('/workers/sign_in')
end

Если("залогинен оператор с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  sleep(2)
end

То("оператора переносят на страницу {string}") do |url|
  expect(page).to have_current_path(url)
end


Допустим("Директор заходит на страницу авторизации") do
  visit('/workers/sign_in')
end

Если("залогинен директор с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  sleep(2)
end

То("директора переносят на страницу {string}") do |url|
  expect(page).to have_current_path(url)
end


Допустим("Заходим на страницу авторизации") do
  visit('/workers/sign_in')
end

Если("пытаемся залогиниться с email {string} и паролем {string}") do |email, password|
  within('#new_worker') do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  sleep(2)
end

То("мы остаемся на странице {string}") do |url|
  expect(page).to have_current_path(url)
end
