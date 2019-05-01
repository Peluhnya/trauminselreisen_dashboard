require 'test_helper'

class HotelSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_site = hotel_sites(:one)
  end

  test "should get index" do
    get hotel_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_site_url
    assert_response :success
  end

  test "should create hotel_site" do
    assert_difference('HotelSite.count') do
      post hotel_sites_url, params: { hotel_site: { hotel_id: @hotel_site.hotel_id, link: @hotel_site.link, site_id: @hotel_site.site_id } }
    end

    assert_redirected_to hotel_site_url(HotelSite.last)
  end

  test "should show hotel_site" do
    get hotel_site_url(@hotel_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_site_url(@hotel_site)
    assert_response :success
  end

  test "should update hotel_site" do
    patch hotel_site_url(@hotel_site), params: { hotel_site: { hotel_id: @hotel_site.hotel_id, link: @hotel_site.link, site_id: @hotel_site.site_id } }
    assert_redirected_to hotel_site_url(@hotel_site)
  end

  test "should destroy hotel_site" do
    assert_difference('HotelSite.count', -1) do
      delete hotel_site_url(@hotel_site)
    end

    assert_redirected_to hotel_sites_url
  end
end
