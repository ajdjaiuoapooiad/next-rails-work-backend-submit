class Api::V1::ProfilesController < ApplicationController
    before_action :authorize_request
    before_action :set_profile, only: [:show, :update]
  
    def show
      render json: @profile
    end
  
    def create
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        render json: @profile, status: :created
      else
        render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @profile.update(profile_params)
        render json: @profile
      else
        render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def profile_params
      params.permit(:introduction, :skills, :company_name, :industry)
    end
  
    def set_profile
      @profile = current_user.profile
    end
  end