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
  
  scenario 'Signs in as Admin, CRUD Links'  do
    Rails.application.env_config['omniauth.auth']  = google_oauth2_mock_admin
    visit new_member_session_path
    click_link 'Sign in with Google'
    visit affiliate_orgs_path
    click_on 'New Affiliate Org'
    fill_in 'org_name', with: 'Test Org Name'
    fill_in 'org_link', with: 'Test Org link'
    fill_in 'org_desc', with: 'Test Org desc'
    click_on 'Create Affiliate org'
    click_on 'Back'
    expect(page).to have_content('Test Org Name')
    expect(page).to have_content('Test Org link')
    expect(page).to have_content('Test Org desc')
    click_on 'Edit'
    fill_in 'org_name', with: 'Titlez'
    click_on 'Update Affiliate org'
    click_on 'Back'
    expect(page).to have_content('Titlez')
  end
  
  scenario 'Attempt to edit links without signing in as ADMIN' do
    visit affiliate_orgs_path
    expect(page).to_not have_content('New Affiliate Org')
    expect(page).to have_content('Affiliate Orgs')
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