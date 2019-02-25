# Если("он удаляет сотрудника с именем {string}") do |nickname|
#   visit("admin/workers")
#   unless find_worker(name).nil?
#     worker_id = find_worker(name).id
#     binding.pry
#     click_link("worker/#{worker_id}")

#     page.driver.browser.switch_to.alert.accept
#   end
# end

# То("сотрудника {string} не видно в списке сотрудников") do |string|
#   visit("admin/workers")
#   find('td', text: 'Серик', match: :prefer_exact)
# end



Если("сотрудника с именем {string} он удаляет") do |string|
  visit("admin/workers")
  unless find_worker(name).nil?
    worker_id = find_worker(name).id
    # binding.pry
    click_link("worker/#{worker_id}")

    page.driver.browser.switch_to.alert.accept
  end
end

То("сотрудника {string} не видно в списке сотрудников") do |nickname|
  find('td', text: nickname, match: :prefer_exact) == nil
end

def find_worker(name)
  Worker.find_by(nickname: "#{name}")
end