# frozen_string_literal: true

require 'rails_helper'

# From https://stackoverflow.com/questions/52171212/using-minitest-when-trying-to-test-omniauth-google-oauth2-gem-i-keep-getting

RSpec.describe 'Authentication test', type: :feature do
  before do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  end

  teardown do
    OmniAuth.config.test_mode = false
  end

  scenario 'Signs in as Admin and upload a video from the Tube' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_admin
    visit new_member_session_path
    click_link 'Sign in with Google'
    visit new_video_path
    fill_in 'Title', with: 'test video title'
    fill_in 'Uploader', with: 'test video uploader'
    fill_in 'Link', with: 'https://www.youtube.com/embed/rLDPrztBD2A'
    click_on 'Create Video'
    visit videos_path
    expect(page).to have_content('Instructions to Upload a Video from Youtube')
    expect(page).to have_content('Instructions to Upload a Video from Google Drive')
    expect(page).to have_content('test video title')
    expect(page).to have_content('test video uploader')
    expect(page).to have_content('https://www.youtube.com/embed/rLDPrztBD2A')
  end

  scenario 'Signs in as Admin and upload a video from the Tube then sign out and view' do
    Rails.application.env_config['omniauth.auth'] = google_oauth2_mock_admin
    visit new_member_session_path
    click_link 'Sign in with Google'
    visit new_video_path
    fill_in 'Title', with: 'test video title'
    fill_in 'Uploader', with: 'test video uploader'
    fill_in 'Link', with: 'https://www.youtube.com/embed/rLDPrztBD2A'
    click_on 'Create Video'
    visit destroy_member_session_path
    visit videos_path
    expect(page).to have_selector('iframe')
    #within_element('iframe') do
      #expect(element).to have_content('https://www.youtube.com/embed/rLDPrztBD2A')
      #find('https://www.youtube.com/embed/rLDPrztBD2A')
    #end
    #within_frame('iframe.body') do
    #    page.should have_content 'https://www.youtube.com/embed/rLDPrztBD2A'
    #end
    expect(page).to_not have_content('Instructions to Upload a Video from Youtube')
    expect(page).to_not have_content('Instructions to Upload a Video from Google Drive')
    expect(page).to_not have_content('test video title')
    expect(page).to_not have_content('test video uploader')
    expect(page).to_not have_content('https://www.youtube.com/embed/rLDPrztBD2A')
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