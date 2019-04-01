Допустим("пользователь с email {string} и паролем {string}") do |email, password|
  visit("admin/orders")
end

Если("он жмёт на ссылку {string}") do |order_all|
  find('#all_orders').click
end

То("заказы в со статусом {string} видно в таблице") do |order_all|
  # find('th', text: status, match: :prefer_exact) 
  page.has_content?('order_all')
end

Допустим("администратор жмёт на ссылку {string}") do |status|
  click_link("#{status}")
  sleep(10)
end

То("увидит в таблице заказы со статусом {string}") do |status|
  find('td', text: status, match: :prefer_exact)
    sleep(1)
end

# private

# def find_all_order
#   Order.count
# end


