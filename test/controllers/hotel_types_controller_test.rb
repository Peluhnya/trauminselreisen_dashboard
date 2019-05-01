require 'test_helper'

class HotelTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_type = hotel_types(:one)
  end

  test "should get index" do
    get hotel_types_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_type_url
    assert_response :success
  end

  test "should create hotel_type" do
    assert_difference('HotelType.count') do
      post hotel_types_url, params: { hotel_type: { apr: @hotel_type.apr, apr_origin: @hotel_type.apr_origin, aug: @hotel_type.aug, aug_origin: @hotel_type.aug_origin, dec: @hotel_type.dec, dec_origin: @hotel_type.dec_origin, feb: @hotel_type.feb, feb_origin: @hotel_type.feb_origin, hotel_site_id: @hotel_type.hotel_site_id, jan: @hotel_type.jan, jan_origin: @hotel_type.jan_origin, july: @hotel_type.july, july_origin: @hotel_type.july_origin, june: @hotel_type.june, june_origin: @hotel_type.june_origin, link_number: @hotel_type.link_number, mar: @hotel_type.mar, mar_origin: @hotel_type.mar_origin, may: @hotel_type.may, may_origin: @hotel_type.may_origin, name: @hotel_type.name, nov: @hotel_type.nov, nov_origin: @hotel_type.nov_origin, oct: @hotel_type.oct, oct_origin: @hotel_type.oct_origin, sep_origin: @hotel_type.sep_origin, sept: @hotel_type.sept, year: @hotel_type.year } }
    end

    assert_redirected_to hotel_type_url(HotelType.last)
  end

  test "should show hotel_type" do
    get hotel_type_url(@hotel_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_type_url(@hotel_type)
    assert_response :success
  end

  test "should update hotel_type" do
    patch hotel_type_url(@hotel_type), params: { hotel_type: { apr: @hotel_type.apr, apr_origin: @hotel_type.apr_origin, aug: @hotel_type.aug, aug_origin: @hotel_type.aug_origin, dec: @hotel_type.dec, dec_origin: @hotel_type.dec_origin, feb: @hotel_type.feb, feb_origin: @hotel_type.feb_origin, hotel_site_id: @hotel_type.hotel_site_id, jan: @hotel_type.jan, jan_origin: @hotel_type.jan_origin, july: @hotel_type.july, july_origin: @hotel_type.july_origin, june: @hotel_type.june, june_origin: @hotel_type.june_origin, link_number: @hotel_type.link_number, mar: @hotel_type.mar, mar_origin: @hotel_type.mar_origin, may: @hotel_type.may, may_origin: @hotel_type.may_origin, name: @hotel_type.name, nov: @hotel_type.nov, nov_origin: @hotel_type.nov_origin, oct: @hotel_type.oct, oct_origin: @hotel_type.oct_origin, sep_origin: @hotel_type.sep_origin, sept: @hotel_type.sept, year: @hotel_type.year } }
    assert_redirected_to hotel_type_url(@hotel_type)
  end

  test "should destroy hotel_type" do
    assert_difference('HotelType.count', -1) do
      delete hotel_type_url(@hotel_type)
    end

    assert_redirected_to hotel_types_url
  end
end
