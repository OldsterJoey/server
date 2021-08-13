class AdminProfilesController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_admin_profile, only: [:show]
    before_action :check_ownership, only: [:show, :update, :destroy]

    def index
        @admin_profiles = admin_profile.all
        render json: @admin_profiles
    end

    def create
        @admin_profile = current_user.admin_profiles.create(admin_profile_params)
        if @admin_profile.errors.any?
            render json: @admin_profile.errors, status: :unprocessable_entity 
        else
            render json: @admin_profile, status: 201
        end
    end

    def show
        render json: @admin_profile.transform_admin
    end

    def update
        @admin_profile.update(admin_profile_params)
        if @admin_profile.errors.any?
            render json: @admin_profile.errors, status: :unprocessable_entity 
        else
            render json: @admin_profile, status: 201
        end
    end

    def destroy
        @admin_profile.destroy
        render json: 204
    end

    private
    def admin_profile_params
        params.permit(:name)
    end

    def set_admin_profile
        @admin_profile = admin_profile.find(params[:id])
        rescue
            render json: {error: "Guardian is not found"}, status: 404
        end
    end

    def check_ownership
        if current_user.id != @admin_profile.user.id
            render json: {error: "You don't have permission to do that"}, status: 401
        end
    end
end
