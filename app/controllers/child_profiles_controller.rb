class ChildProfilesController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_child_profile, only: [:show, :update, :destroy]
    def index
        @child_profiles = ChildProfile.all
        render json: @child_profiles, include:["wish_list"]
    end

    def create
        @child_profile = current_user.child_profiles.create(child_profile_params)
        if @child_profile.errors.any?
            render json: @child_profile.errors, status: :unprocessable_entity 
        else
            render json: @child_profile, status: 201
        end
    end

    def show
        render json: @child_profile
    end

    def update
        @child_profile.update(child_profile_params)
        if @child_profile.errors.any?
            render json: @child_profile.errors, status: :unprocessable_entity 
        else
            render json: @child_profile, status: 201
        end
    end

    def destroy
        @child_profile.delete
        render json: 204
    end

    private
    def child_profile_params
        params.permit(:id, :name, :wish_list_id)
    end

    def set_child_profile
        begin
        @child_profile = ChildProfile.find(params[:id])
        rescue
            render json: {error: "Child is not found"}, status: 404
        end
    end
end
