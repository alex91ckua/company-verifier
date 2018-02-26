class GtMetrixTestsController < ApplicationController
  before_action :set_gt_metrix_test, only: [:show, :update, :destroy]

  # GET /gt_metrix_tests
  def index
    @gt_metrix_tests = GtMetrixTest.all

    render json: @gt_metrix_tests
  end

  # GET /gt_metrix_tests/1
  def show
    render json: @gt_metrix_test
  end

  # POST /gt_metrix_tests
  def create
    @gt_metrix_test = GtMetrixTest.new(gt_metrix_test_params)

    if @gt_metrix_test.save
      render json: @gt_metrix_test, status: :created, location: @gt_metrix_test
    else
      render json: @gt_metrix_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gt_metrix_tests/1
  def update
    if @gt_metrix_test.update(gt_metrix_test_params)
      render json: @gt_metrix_test
    else
      render json: @gt_metrix_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gt_metrix_tests/1
  def destroy
    @gt_metrix_test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gt_metrix_test
      @gt_metrix_test = GtMetrixTest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gt_metrix_test_params
      params.require(:gt_metrix_test).permit(:company_id, :page_load_time, :pagespeed_score, :yslow_score, :fully_loaded_time, :report_url)
    end
end
