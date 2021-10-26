# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an announcement', type: :feature do
  scenario 'valid title' do
    visit new_announcement_path
    fill_in 'title', with: 'test announcement title'
    fill_in 'body', with: 'test announcement body'
    select '2020', :from => 'announcement_published_date_1i'
    select 'January', :from => 'announcement_published_date_2i'
    select '10', :from => 'announcement_published_date_3i'
    select '10', :from => 'announcement_published_date_4i'
    select '10', :from => 'announcement_published_date_5i'
    click_on 'Create Announcement'
    visit announcements_path
    expect(page).to have_content('test announcement title')
  end
  
  scenario 'valid body' do
    visit new_announcement_path
    fill_in 'title', with: 'test announcement title'
    fill_in 'body', with: 'test announcement body'
    select '2020', :from => 'announcement_published_date_1i'
    select 'January', :from => 'announcement_published_date_2i'
    select '10', :from => 'announcement_published_date_3i'
    select '10', :from => 'announcement_published_date_4i'
    select '10', :from => 'announcement_published_date_5i'
    click_on 'Create Announcement'
    visit announcements_path
    expect(page).to have_content('test announcement body')
  end

  scenario 'valid inputs' do
    visit new_announcement_path
    fill_in 'title', with: 'test announcement title'
    fill_in 'body', with: 'test announcement body'
    select '2020', :from => 'announcement_published_date_1i'
    select 'January', :from => 'announcement_published_date_2i'
    select '10', :from => 'announcement_published_date_3i'
    select '10', :from => 'announcement_published_date_4i'
    select '10', :from => 'announcement_published_date_5i'
    click_on 'Create Announcement'
    visit announcements_path
    expect(page).to have_content('2020-01-10 10:10')
  end

end
