class ChildProfilesController < ApplicationController
    before_action :set_child_profile, only: [:show]
    def index
        @child_profiles = ChildProfile.all
        render json: @child_profiles
    end

    def create
        @child_profile = ChildProfile.create(child_profile_params)
        if @child_profile.errors.any?
            render json: @child_profile.errors, status: :unprocessable_entity 
        else
            render json: @child_profile, status: 201
        end
    end

    def show
        render json: @child_profile
    end

    private
    def child_profile_params
        params.permit(:name, :wish_list_id)
    end

    def set_child_profile
        @child_profile = ChildProfile.find(params[:id])
    end
end
