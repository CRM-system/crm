Допустим("создает должность с названием {string}") do |title|
  visit('admin/roles/new')

  within('.fields form') do
    fill_in('Название', with: title)
    click_button('Подтвердить')
  end
end

Если("он удаляет должность с названием {string}") do |title|
  visit('admin/roles')

  unless find_role(title).nil?
    role_id = find_role(title).id
    click_link("role/#{role_id}")

    page.driver.browser.switch_to.alert.accept
  end
end

То("{string} не видно в списке должностей") do |title|
  expect(page).to have_no_content "#{title}"
end

private

def find_role(title)
  Role.find_by(name: "#{title}")
end
