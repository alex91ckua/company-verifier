require 'test_helper'

class GtMetrixTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gt_metrix_test = gt_metrix_tests(:one)
  end

  test "should get index" do
    get gt_metrix_tests_url, as: :json
    assert_response :success
  end

  test "should create gt_metrix_test" do
    assert_difference('GtMetrixTest.count') do
      post gt_metrix_tests_url, params: { gt_metrix_test: { company_id: @gt_metrix_test.company_id, fully_loaded_time: @gt_metrix_test.fully_loaded_time, page_load_time: @gt_metrix_test.page_load_time, pagespeed_score: @gt_metrix_test.pagespeed_score, report_url: @gt_metrix_test.report_url, yslow_score: @gt_metrix_test.yslow_score } }, as: :json
    end

    assert_response 201
  end

  test "should show gt_metrix_test" do
    get gt_metrix_test_url(@gt_metrix_test), as: :json
    assert_response :success
  end

  test "should update gt_metrix_test" do
    patch gt_metrix_test_url(@gt_metrix_test), params: { gt_metrix_test: { company_id: @gt_metrix_test.company_id, fully_loaded_time: @gt_metrix_test.fully_loaded_time, page_load_time: @gt_metrix_test.page_load_time, pagespeed_score: @gt_metrix_test.pagespeed_score, report_url: @gt_metrix_test.report_url, yslow_score: @gt_metrix_test.yslow_score } }, as: :json
    assert_response 200
  end

  test "should destroy gt_metrix_test" do
    assert_difference('GtMetrixTest.count', -1) do
      delete gt_metrix_test_url(@gt_metrix_test), as: :json
    end

    assert_response 204
  end
end
