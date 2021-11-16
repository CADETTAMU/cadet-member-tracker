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
  
  scenario 'Signs in as Admin, CRUD New Meeting & CRUD Attend meeting'  do
    Rails.application.env_config['omniauth.auth']  = google_oauth2_mock_admin
    visit new_member_session_path
    click_link 'Sign in with Google'
    visit attendances_path
    click_on 'View Meetings'
    click_on 'New Meeting'
    fill_in 'Name', with: 'Test Meeting Title'
    fill_in 'Number', with: 123
    click_on 'Create Meeting'
    click_on 'Back'
    expect(page).to have_content('Test Meeting Title')
    expect(page).to have_content('123')
    click_on 'Edit'
    fill_in 'Name', with: 'Meeting Titlez'
    fill_in 'Number', with: 321
    click_on 'Update Meeting'
    click_on 'Back'
    expect(page).to have_content('Meeting Titlez')
    expect(page).to have_content('321')
    click_on 'Back'
    click_on 'Click to Attend'
    click_on 'Back'
    expect(page).to have_content('321')
    click_on 'Edit'
    expect(page).to have_content('When?')
    # fill_in 'number', with: 456
    # click_on 'Update Attendance'
    # click_on 'Back'
    # expect(page).to have_content('456')
    # click_on 'Destroy'
    # click_on 'OK'
    # expect(page).to have_content('Attendance was succeessfully destroyed.')
    # click_on 'View Meetings'
    # click_on 'Destroy'
    # click_on 'OK'
    # expect(page).to have_content('Attendance was succeessfully destroyed.')
  end
  
  scenario 'Attempt to visit attendances without signing in (SHOULD FAIL)' do
    visit attendances_path
    expect(page).to_not have_content('Attendances')
    expect(page).to_not have_content('Name')
    expect(page).to_not have_content('Email')
    expect(page).to_not have_content('Meeting#')
    expect(page).to_not have_content('Date/Time')
  end

  scenario 'Attempt to visit meetings without signing in (SHOULD FAIL)' do
    visit meetings_path
    expect(page).to_not have_content('Meetings')
    expect(page).to_not have_content('Name:')
    expect(page).to_not have_content('Number')
    expect(page).to_not have_content('Start Time')
  end
  
  
  private

  def google_oauth2_mock_admin
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '1',
      info: { 
        email: 'tamucadetwebsite@gmail.com',
        full_name: 'CADET TAMU',
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
        full_name: 'Bassel Toubbeh',
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
        full_name: 'Ryan Pickett',
      },
      credentials: {
        token: 'thirdtoken',
        refresh_token: 'thirdtoken',
        expires_at: DateTime.now
      }
    })
  end
end