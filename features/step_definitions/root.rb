Допустим("находимся на главной странице") do
  visit('')
end

Если("нажимаем на кнопку {string}") do |log_in|
  click_link("#{log_in}")
end

То("происходит переход на страницу авторизации") do
  url = URI.parse(current_url).path
  expect(page).to have_current_path(url)

  sleep(2)
end
