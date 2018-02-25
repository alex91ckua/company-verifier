class TestingJobsController < ApplicationController
  before_action :set_testing_job, only: [:show, :update, :destroy]

  # GET /testing_jobs
  def index
    @testing_jobs = TestingJob.all

    render json: @testing_jobs
  end

  # GET /testing_jobs/1
  def show
    render json: @testing_job
  end

  # POST /testing_jobs
  def create
    @testing_job = TestingJob.new(testing_job_params)

    if @testing_job.save
      render json: @testing_job, status: :created, location: @testing_job
    else
      render json: @testing_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /testing_jobs/1
  def update
    if @testing_job.update(testing_job_params)
      render json: @testing_job
    else
      render json: @testing_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /testing_jobs/1
  def destroy
    @testing_job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testing_job
      @testing_job = TestingJob.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def testing_job_params
      params.require(:testing_job).permit(:processed, :total)
    end
end
