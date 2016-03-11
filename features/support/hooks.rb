# Before do
#   Capybara.page.driver.browser.manage.window.maximize
# end

Before('@login_before_and_logout_after') do
  visit "/"
  expect(page).to have_content('My amaysim Login')
  fill_in  "my_amaysim2_user_session_login", :with => get_test_data("USERNAME")
  fill_in  "password", :with => get_test_data("PASSWORD")
  click_button 'Login'
  page.find('.logged-in-customer', wait: 300)
  expect(page).to have_content('Hi ' + get_test_data("NAME"))
end

After('@login_before_and_logout_after') do
  begin
    page.execute_script("document.getElementsByClassName('logout-link')[0].scrollIntoView();")
  rescue e
    nil
  end
  page.find('a.logout-link').click
  expect(page).to have_content('My amaysim Login')
end