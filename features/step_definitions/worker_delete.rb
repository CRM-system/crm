Если("сотрудника с именем {string} он удаляет") do |nickname|
  visit('admin/workers')
  binding.pry
  unless find_worker(nickname).nil?
    worker_id = find_worker(nickname).id
    click_link("worker/#{worker_id}")

    page.driver.browser.switch_to.alert.accept
  end
end

То("сотрудника {string} не видно в списке сотрудников") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

# Если("сотрудника с именем {string} он удаляет") do |string|
#   visit("admin/workers")
#   unless find_worker(name).nil?
#     worker_id = find_worker(name).id
#     # binding.pry
#     click_link("worker/#{worker_id}")

#     page.driver.browser.switch_to.alert.accept
#   end
# end

# То("сотрудника {string} не видно в списке сотрудников") do |nickname|
#   find('td', text: nickname, match: :prefer_exact) == nil
# end

# def find_worker(name)
#   Worker.find_by(nickname: "#{name}")
# end

private

def find_worker(nickname)
  Role.find_by(name: "#{nickname}")
end