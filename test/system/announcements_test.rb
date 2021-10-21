require "application_system_test_case"

class AnnouncementsTest < ApplicationSystemTestCase
  setup do
    @announcement = announcements(:one)
  end

  test "visiting the index" do
    visit announcements_url
    assert_selector "h1", text: "Announcements"
  end

  test "creating a Announcement" do
    visit announcements_url
    click_on "New Announcement"

<<<<<<< HEAD
    fill_in "Body", with: @announcement.body
=======
    fill_in "Author", with: @announcement.author
    fill_in "Publish date", with: @announcement.publish_date
<<<<<<< HEAD
    fill_in "Publish", with: @announcement.publish_id
>>>>>>> dev
=======
>>>>>>> 650714873def2635752563da8831e2aa8d93d20d
    fill_in "Title", with: @announcement.title
    click_on "Create Announcement"

    assert_text "Announcement was successfully created"
    click_on "Back"
  end

  test "updating a Announcement" do
    visit announcements_url
    click_on "Edit", match: :first

<<<<<<< HEAD
    fill_in "Body", with: @announcement.body
=======
    fill_in "Author", with: @announcement.author
    fill_in "Publish date", with: @announcement.publish_date
<<<<<<< HEAD
    fill_in "Publish", with: @announcement.publish_id
>>>>>>> dev
=======
>>>>>>> 650714873def2635752563da8831e2aa8d93d20d
    fill_in "Title", with: @announcement.title
    click_on "Update Announcement"

    assert_text "Announcement was successfully updated"
    click_on "Back"
  end

  test "destroying a Announcement" do
    visit announcements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Announcement was successfully destroyed"
  end
end
