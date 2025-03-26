class Api::V1::JobsController < ApplicationController
  before_action :authorize_request, except: [:index] 
  before_action :set_job, only: [:show, :update, :destroy]
  before_action :require_company, only: [:create, :update, :destroy] # 企業ユーザーのみ許可

  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    render json: @job
  end

  def create
    @job = current_user.jobs.build(job_params) # current_userは企業ユーザー
    if @job.save
      render json: @job, status: :created
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    params.permit(:title, :description, :location, :salary, :requirements, :benefits, :employment_type)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def require_company
    unless current_user.company?
      render json: { error: '権限がありません。企業ユーザーのみ可能です。' }, status: :unauthorized
    end
  end
end