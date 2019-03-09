
Если("он удаляет сотрудника с именем {string}") do |nickname|
  visit('admin/workers')
  unless find_worker(nickname).nil?
    worker_id = find_worker(nickname).id
    click_link("worker/#{worker_id}")
    page.driver.browser.switch_to.alert.accept
  end
end

То("сотрудника {string} не видно в списке сотрудников") do |nickname|
  expect(page).to have_no_content "#{nickname}"
end

private

def find_worker(nickname)
  Worker.find_by(nickname: "#{nickname}")
end

