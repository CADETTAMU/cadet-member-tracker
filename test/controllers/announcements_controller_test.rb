require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement = announcements(:one)
  end

  test "should get index" do
    get announcements_url
    assert_response :success
  end

  test "should get new" do
    get new_announcement_url
    assert_response :success
  end

  test "should create announcement" do
    assert_difference('Announcement.count') do
<<<<<<< HEAD
      post announcements_url, params: { announcement: { body: @announcement.body, title: @announcement.title } }
=======
      post announcements_url, params: { announcement: { author: @announcement.author, publish_date: @announcement.publish_date, publish_id: @announcement.publish_id, title: @announcement.title } }
>>>>>>> dev
    end

    assert_redirected_to announcement_url(Announcement.last)
  end

  test "should show announcement" do
    get announcement_url(@announcement)
    assert_response :success
  end

  test "should get edit" do
    get edit_announcement_url(@announcement)
    assert_response :success
  end

  test "should update announcement" do
<<<<<<< HEAD
    patch announcement_url(@announcement), params: { announcement: { body: @announcement.body, title: @announcement.title } }
=======
    patch announcement_url(@announcement), params: { announcement: { author: @announcement.author, publish_date: @announcement.publish_date, publish_id: @announcement.publish_id, title: @announcement.title } }
>>>>>>> dev
    assert_redirected_to announcement_url(@announcement)
  end

  test "should destroy announcement" do
    assert_difference('Announcement.count', -1) do
      delete announcement_url(@announcement)
    end

    assert_redirected_to announcements_url
  end
end
