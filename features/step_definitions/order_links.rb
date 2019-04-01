Допустим("пользователь с email {string} и паролем {string}") do |email, password|
  visit("admin/orders")
end

Если("он жмёт на ссылку {string}") do |order_all|
  find('#all_orders').click
end

То("заказы в со статусом {string} видно в таблице") do |order_all|
  page.has_content?('order_all')
end

Допустим("администратор жмёт на ссылку {string}") do |status|
  click_link("#{status}")
  sleep(10)
end

То("увидит в таблице заказы со статусом {string}") do |status|
  page.has_content?('new_order')
end




