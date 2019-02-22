Если("он меняет название должности с {string} на {string}") do |old_name, new_name|
  visit('admin/roles')
  role_id = find_role(old_name).id
  click_link("role-edit-#{role_id}")

  within('.fields form') do
    fill_in('Название', with: new_name)
    click_button('Подтвердить')
  end
end

То("при переходе на страницу списка должностей будет видно данную должность {string}") do |new_name|
  visit('admin/roles')

  expect(page).to have_content "#{new_name}"
end

То("потом нужно удалить отредактированную должность {string}") do |new_name|
  role_id = find_role(new_name).id
  click_link("role/#{role_id}")

  page.driver.browser.switch_to.alert.accept
end

private

def find_role(title)
  Role.find_by(name: "#{title}")
end
