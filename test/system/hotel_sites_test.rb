require "application_system_test_case"

class HotelSitesTest < ApplicationSystemTestCase
  setup do
    @hotel_site = hotel_sites(:one)
  end

  test "visiting the index" do
    visit hotel_sites_url
    assert_selector "h1", text: "Hotel Sites"
  end

  test "creating a Hotel site" do
    visit hotel_sites_url
    click_on "New Hotel Site"

    fill_in "Hotel", with: @hotel_site.hotel_id
    fill_in "Link", with: @hotel_site.link
    fill_in "Site", with: @hotel_site.site_id
    click_on "Create Hotel site"

    assert_text "Hotel site was successfully created"
    click_on "Back"
  end

  test "updating a Hotel site" do
    visit hotel_sites_url
    click_on "Edit", match: :first

    fill_in "Hotel", with: @hotel_site.hotel_id
    fill_in "Link", with: @hotel_site.link
    fill_in "Site", with: @hotel_site.site_id
    click_on "Update Hotel site"

    assert_text "Hotel site was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel site" do
    visit hotel_sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel site was successfully destroyed"
  end
end
