Given(/^I am on the Settings page$/) do
  click_link 'My Settings'
  page.find('#settings_sim_nickname', wait: 300)
  expect(page).to have_selector('#edit_settings_call_forwarding')
end

Given(/^I am logged in into the MyAmaysim$/) do
  visit "/"
  expect(page).to have_content('My amaysim Login')
  fill_in  "my_amaysim2_user_session_login", :with => get_test_data("USERNAME")
  fill_in  "password", :with => get_test_data("PASSWORD")
  click_button 'Login'
  page.find('.logged-in-customer', wait: 300)
  expect(page).to have_content('Hi ' + get_test_data("NAME"))
end

Given(/^I enable call forwarding to "(.*?)"$/) do |arg|
  callforward_number = get_test_data(arg)
  
  edit_call_forwarding
  within '#update_call_forwarding_form' do
    page.execute_script("document.getElementById('my_amaysim2_setting_call_divert_true').checked = true")
    fill_in 'my_amaysim2_setting_call_divert_number', :with => callforward_number
    click_button 'Save'
  end
  save_call_forwarding_setting
end

Then(/^I see the "(.*?)" saved in my settings$/) do |arg|
  callforward_number = get_test_data(arg)
  scroll_to_element_by_id 'settings_call_forwarding'
  within '#settings_call_forwarding' do
    expect(page).to have_content("Forward calls to #{callforward_number}")
  end
end

Given(/^I .*disable call forwarding$/) do
  edit_call_forwarding
  within '#update_call_forwarding_form' do
    page.execute_script("document.getElementById('my_amaysim2_setting_call_divert_false').checked = true")
    click_button 'Save'
  end
  save_call_forwarding_setting
end

Given(/^I see the call forwarding disabled in my settings$/) do
  scroll_to_element_by_id 'settings_call_forwarding'
  within '#settings_call_forwarding' do
    expect(page.find('.setting-option-value-text')).to have_content("No")
  end
end

def edit_call_forwarding
  scroll_to_element_by_id 'settings_call_forwarding'

  within '#settings_call_forwarding' do
    click_link 'Edit'
  end
  
  expect(page).to have_selector('a.confirm_popup_confirm')
  page.find('a.confirm_popup_confirm').click
  scroll_to_element_by_id 'settings_call_forwarding'
  page.find('#update_call_forwarding_form',  wait: 300, visible: true)
end

def save_call_forwarding_setting
  page.find('.form_info_popup', wait: 300, visible: true)
  expect(page).to have_selector('.close-reveal-modal')
  page.find('.close-reveal-modal').click
end

def scroll_to_element_by_id(id)
  element = page.find("#"+id, wait: 300, visible: true)
  page.execute_script "document.getElementById(\"#{id}\").scrollIntoView();"
end
  