Если("он удаляет этот заказ") do
  visit("admin/orders")
  click_link("order/3")
  page.driver.browser.switch_to.alert.accept
end

То("в списке заказов он не видит этот заказ") do
 expect(page).to have_no_content "order/3"
end