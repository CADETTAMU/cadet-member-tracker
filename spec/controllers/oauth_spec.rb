# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

# From https://stackoverflow.com/questions/52171212/using-minitest-when-trying-to-test-omniauth-google-oauth2-gem-i-keep-getting

RSpec.describe 'Authentication test', type: :feature do
  before do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  end

  teardown do
    OmniAuth.config.test_mode = false
  end

  scenario 'Signs in as Admin' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_admin
    visit new_member_session_path
    click_link 'Sign in with Google'
    expect(page).to have_content('Successfully authenticated')
  end

  scenario 'Attempt to sign in without regex match' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_fail
    visit new_member_session_path
    click_link 'Sign in with Google'
    expect(page).to have_content('Could not authenticate')
  end

  scenario 'Attempt to sign in with regex match' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_user
    visit new_member_session_path
    click_link 'Sign in with Google'
    expect(page).to have_content('Successfully authenticated')
  end
  
  scenario 'Changing a user\'s permissions' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_user
	visit new_member_session_path
	click_link 'Sign in with Google'
	visit new_member_session_path
	click_link 'Sign Out'
	Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_admin
	visit new_member_session_path
	click_link 'Sign in with Google'
	visit new_member_session_path
	click_link 'Edit User'
	# Find the checkbox and click it. From: https://stackoverflow.com/questions/26604053/how-to-easily-uncheck-all-checkboxes-with-capybara/26610955
	all('input[type=checkbox]').each do |checkbox|
      if checkbox.checked? then 
        checkbox.click
      end
    end
	click_button 'Update Member'
	expect(page).not_to match('Member$')
  end
  
  scenario 'Deleting a User' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_user
	visit new_member_session_path
	click_link 'Sign in with Google'
	visit new_member_session_path
	click_link 'Sign Out'
	Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_admin
	visit new_member_session_path
	click_link 'Sign in with Google'
    visit new_member_session_path
    click_link 'Delete User'
	expect(page).not_to have_content('member@tamu.edu')
  end
  
  scenario 'Failed access to edit' do
	@member = Member.create(email: 'member@tamu.edu', id: 1)
	Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_user
	visit new_member_session_path
	click_link 'Sign in with Google'
    # Check a regular member can't edit others
	visit '/sign_in/1/edit'
	expect(page).not_to have_content('Is admin')
    visit new_member_session_path
	# Check a visitor can't edit others
    click_link 'Sign Out'
	visit '/sign_in/1/edit'
	expect(page).not_to have_content('Is admin')
  end

  private

  def google_oauth2_mock_admin
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                         provider: 'google_oauth2',
                                                                         uid: '1',
                                                                         info: {
                                                                           email: 'tamucadetwebsite@gmail.com',
                                                                           full_name: 'CADET TAMU'
                                                                         },
                                                                         credentials: {
                                                                           token: 'token here',
                                                                           refresh_token: 'token here',
                                                                           expires_at: DateTime.now
                                                                         }
                                                                       })
  end

  def google_oauth2_mock_fail
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                         provider: 'google_oauth2',
                                                                         uid: '12345678910',
                                                                         info: {
                                                                           email: 'not_allowed@gmail.com',
                                                                           full_name: 'Bassel Toubbeh'
                                                                         },
                                                                         credentials: {
                                                                           token: 'another token',
                                                                           refresh_token: 'another token',
                                                                           expires_at: DateTime.now
                                                                         }
                                                                       })
  end

  def google_oauth2_mock_user
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                         provider: 'google_oauth2',
                                                                         uid: '12345678910',
                                                                         info: {
                                                                           email: 'member@tamu.edu',
                                                                           full_name: 'Ryan Pickett'
                                                                         },
                                                                         credentials: {
                                                                           token: 'thirdtoken',
                                                                           refresh_token: 'thirdtoken',
                                                                           expires_at: DateTime.now
                                                                         }
                                                                       })
  end
end
