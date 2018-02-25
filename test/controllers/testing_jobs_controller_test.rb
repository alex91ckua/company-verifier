require 'test_helper'

class TestingJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testing_job = testing_jobs(:one)
  end

  test "should get index" do
    get testing_jobs_url, as: :json
    assert_response :success
  end

  test "should create testing_job" do
    assert_difference('TestingJob.count') do
      post testing_jobs_url, params: { testing_job: { processed: @testing_job.processed, total: @testing_job.total } }, as: :json
    end

    assert_response 201
  end

  test "should show testing_job" do
    get testing_job_url(@testing_job), as: :json
    assert_response :success
  end

  test "should update testing_job" do
    patch testing_job_url(@testing_job), params: { testing_job: { processed: @testing_job.processed, total: @testing_job.total } }, as: :json
    assert_response 200
  end

  test "should destroy testing_job" do
    assert_difference('TestingJob.count', -1) do
      delete testing_job_url(@testing_job), as: :json
    end

    assert_response 204
  end
end
