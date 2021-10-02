require "application_system_test_case"

class AffiliateOrgsTest < ApplicationSystemTestCase
  setup do
    @affiliate_org = affiliate_orgs(:one)
  end

  test "visiting the index" do
    visit affiliate_orgs_url
    assert_selector "h1", text: "Affiliate Orgs"
  end

  test "creating a Affiliate org" do
    visit affiliate_orgs_url
    click_on "New Affiliate Org"

    fill_in "Org desc", with: @affiliate_org.org_desc
    fill_in "Org link", with: @affiliate_org.org_link
    fill_in "Org name", with: @affiliate_org.org_name
    click_on "Create Affiliate org"

    assert_text "Affiliate org was successfully created"
    click_on "Back"
  end

  test "updating a Affiliate org" do
    visit affiliate_orgs_url
    click_on "Edit", match: :first

    fill_in "Org desc", with: @affiliate_org.org_desc
    fill_in "Org link", with: @affiliate_org.org_link
    fill_in "Org name", with: @affiliate_org.org_name
    click_on "Update Affiliate org"

    assert_text "Affiliate org was successfully updated"
    click_on "Back"
  end

  test "destroying a Affiliate org" do
    visit affiliate_orgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Affiliate org was successfully destroyed"
  end
end
