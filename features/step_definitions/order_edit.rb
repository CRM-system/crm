То("он видит заказ со статусом {string}") do |string|

	find('td', text: status, match: :prefer_exact)
end

Если("он меняет статус заказа с {string} на {string}") do |current_status, new_status|

	visit("admin/orders/1/edit")
	within '#order_status' do
		find("option[value='confirmed']").click
	end
	click_button('Подтвердить')

end

То("в списке заказов видит этот заказ с изменненым статусом") do
	find('td', text: status, match: :prefer_exact)
end
