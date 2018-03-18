class GtMetrixTestsController < ApplicationController
  
  # GET /gt_metrix_tests
  def index
    @gt_metrix_tests = GtMetrixTest.all

    render json: @gt_metrix_tests
  end

  # GET /gt_metrix_tests/1
  def show
    render json: @gt_metrix_test
  end

end
