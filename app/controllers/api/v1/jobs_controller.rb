class Api::V1::JobsController < ApplicationController
    before_action :authorize_request, except: [:index, :show]
    before_action :set_job, only: [:show, :update, :destroy]
  
    def index
      @jobs = Job.all
      render json: @jobs
    end
  
    def show
      render json: @job
    end
  
    def create
      @job = current_user.jobs.build(job_params)
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
      params.permit(:title, :description, :salary, :location)
    end
  
    def set_job
      @job = Job.find(params[:id])
    end
  end