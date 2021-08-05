class AdminProfilesController < ApplicationController
    before_action :set_admin_profile, only: [:show]
    def index
        @admin_profiles = admin_profile.all
        render json: @admin_profiles
    end

    def create
        @admin_profile = admin_profile.create(admin_profile_params)
        if @admin_profile.errors.any?
            render json: @admin_profile.errors, status: :unprocessable_entity 
        else
            render json: @admin_profile, status: 201
        end
    end

    def show
        render json: @admin_profile
    end

    private
    def admin_profile_params
        params.permit(:admin_profile, :answer)
    end

    def set_admin_profile
        @admin_profile = admin_profile.find(params[:id])
    end
end
