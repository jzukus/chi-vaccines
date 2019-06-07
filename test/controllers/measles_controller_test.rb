require 'test_helper'

class MeaslesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measle = measles(:one)
  end

  test "should get index" do
    get measles_url
    assert_response :success
  end

  test "should get new" do
    get new_measle_url
    assert_response :success
  end

  test "should create measle" do
    assert_difference('Measle.count') do
      post measles_url, params: { measle: { compliance_bin: @measle.compliance_bin, district: @measle.district, enrollment: @measle.enrollment, facility: @measle.facility, protection: @measle.protection, protection_bin: @measle.protection_bin, school_compliance: @measle.school_compliance, school_id: @measle.school_id } }
    end

    assert_redirected_to measle_url(Measle.last)
  end

  test "should show measle" do
    get measle_url(@measle)
    assert_response :success
  end

  test "should get edit" do
    get edit_measle_url(@measle)
    assert_response :success
  end

  test "should update measle" do
    patch measle_url(@measle), params: { measle: { compliance_bin: @measle.compliance_bin, district: @measle.district, enrollment: @measle.enrollment, facility: @measle.facility, protection: @measle.protection, protection_bin: @measle.protection_bin, school_compliance: @measle.school_compliance, school_id: @measle.school_id } }
    assert_redirected_to measle_url(@measle)
  end

  test "should destroy measle" do
    assert_difference('Measle.count', -1) do
      delete measle_url(@measle)
    end

    assert_redirected_to measles_url
  end
end
