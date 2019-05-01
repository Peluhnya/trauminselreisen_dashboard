require "application_system_test_case"

class HotelTypesTest < ApplicationSystemTestCase
  setup do
    @hotel_type = hotel_types(:one)
  end

  test "visiting the index" do
    visit hotel_types_url
    assert_selector "h1", text: "Hotel Types"
  end

  test "creating a Hotel type" do
    visit hotel_types_url
    click_on "New Hotel Type"

    fill_in "Apr", with: @hotel_type.apr
    fill_in "Apr origin", with: @hotel_type.apr_origin
    fill_in "Aug", with: @hotel_type.aug
    fill_in "Aug origin", with: @hotel_type.aug_origin
    fill_in "Dec", with: @hotel_type.dec
    fill_in "Dec origin", with: @hotel_type.dec_origin
    fill_in "Feb", with: @hotel_type.feb
    fill_in "Feb origin", with: @hotel_type.feb_origin
    fill_in "Hotel site", with: @hotel_type.hotel_site_id
    fill_in "Jan", with: @hotel_type.jan
    fill_in "Jan origin", with: @hotel_type.jan_origin
    fill_in "July", with: @hotel_type.july
    fill_in "July origin", with: @hotel_type.july_origin
    fill_in "June", with: @hotel_type.june
    fill_in "June origin", with: @hotel_type.june_origin
    fill_in "Link number", with: @hotel_type.link_number
    fill_in "Mar", with: @hotel_type.mar
    fill_in "Mar origin", with: @hotel_type.mar_origin
    fill_in "May", with: @hotel_type.may
    fill_in "May origin", with: @hotel_type.may_origin
    fill_in "Name", with: @hotel_type.name
    fill_in "Nov", with: @hotel_type.nov
    fill_in "Nov origin", with: @hotel_type.nov_origin
    fill_in "Oct", with: @hotel_type.oct
    fill_in "Oct origin", with: @hotel_type.oct_origin
    fill_in "Sep origin", with: @hotel_type.sep_origin
    fill_in "Sept", with: @hotel_type.sept
    fill_in "Year", with: @hotel_type.year
    click_on "Create Hotel type"

    assert_text "Hotel type was successfully created"
    click_on "Back"
  end

  test "updating a Hotel type" do
    visit hotel_types_url
    click_on "Edit", match: :first

    fill_in "Apr", with: @hotel_type.apr
    fill_in "Apr origin", with: @hotel_type.apr_origin
    fill_in "Aug", with: @hotel_type.aug
    fill_in "Aug origin", with: @hotel_type.aug_origin
    fill_in "Dec", with: @hotel_type.dec
    fill_in "Dec origin", with: @hotel_type.dec_origin
    fill_in "Feb", with: @hotel_type.feb
    fill_in "Feb origin", with: @hotel_type.feb_origin
    fill_in "Hotel site", with: @hotel_type.hotel_site_id
    fill_in "Jan", with: @hotel_type.jan
    fill_in "Jan origin", with: @hotel_type.jan_origin
    fill_in "July", with: @hotel_type.july
    fill_in "July origin", with: @hotel_type.july_origin
    fill_in "June", with: @hotel_type.june
    fill_in "June origin", with: @hotel_type.june_origin
    fill_in "Link number", with: @hotel_type.link_number
    fill_in "Mar", with: @hotel_type.mar
    fill_in "Mar origin", with: @hotel_type.mar_origin
    fill_in "May", with: @hotel_type.may
    fill_in "May origin", with: @hotel_type.may_origin
    fill_in "Name", with: @hotel_type.name
    fill_in "Nov", with: @hotel_type.nov
    fill_in "Nov origin", with: @hotel_type.nov_origin
    fill_in "Oct", with: @hotel_type.oct
    fill_in "Oct origin", with: @hotel_type.oct_origin
    fill_in "Sep origin", with: @hotel_type.sep_origin
    fill_in "Sept", with: @hotel_type.sept
    fill_in "Year", with: @hotel_type.year
    click_on "Update Hotel type"

    assert_text "Hotel type was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel type" do
    visit hotel_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel type was successfully destroyed"
  end
end
