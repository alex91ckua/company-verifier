class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    # @companies = Company.select('gt_metrix_tests.state as gt_metrix_test_state', :id, :name, :website_url, :email).joins(:gt_metrix_test).all
    per_page = 20
    @companies = Company.order(:id).page(params[:page]).per(per_page)
    prev_page = Company.order(:id).page(params[:page]).per(per_page).prev_page
    next_page = Company.order(:id).page(params[:page]).per(per_page).next_page
    current_page = Company.order(:id).page(params[:page]).per(per_page).current_page

    result = Hash.new
    result[:results] = @companies
    result[:prev_page] = prev_page if prev_page
    result[:next_page] = next_page if next_page
    result[:current_page] = current_page if current_page

    render json: result
  end

  # GET /companies/1
  def show
    result = {
        'company' => @company,
        'gt_metrix_test' => @company.gt_metrix_test
    }
    render json: result
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.includes(:gt_metrix_test).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:name, :website_url, :email)
    end
end
