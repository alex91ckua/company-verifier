class TestLogsController < ApplicationController

  # GET /test_logs
  def index
    @test_logs = apply_scopes(TestLog).all

    render json: @test_logs
  end

  # GET /test_logs/1
  def show
    render json: @test_log
  end
end
