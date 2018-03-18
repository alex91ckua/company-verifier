class GtMetrixTestsController < ApplicationController

  has_scope :by_page_speed, using: [:from, :to], only: :index
  has_scope :by_yslow_score, using: [:from, :to], only: :index

  # Filters available
  # ?by_page_speed[from]=79&by_page_speed[to]=999&by_yslow_score[from]=0&by_yslow_score[to]=80

  # GET /gt_metrix_tests
  def index
    @gt_metrix_tests = apply_scopes(GtMetrixTest).all

    render json: @gt_metrix_tests
  end

  # GET /gt_metrix_tests/1
  def show
    render json: @gt_metrix_test
  end

end
