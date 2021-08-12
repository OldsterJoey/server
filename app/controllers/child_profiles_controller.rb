class ChildProfilesController < ApplicationController
    # before_action :authenticate_user, except: [:index, :show]
    before_action :set_child_profile, only: [:show, :update, :destroy]
    before_action :check_ownership, only: [:update, :destroy]
    
    def index
        @child_profiles = ChildProfile.all
        # render json: @child_profiles, include: ["wish_list", "wishes"]
        render json: @child_profiles, include: {wish_list: {
                                            include: :wishes}}
    end

    def create
        @child_profile = current_user.child_profiles.create(child_profile_params)
        if @child_profile.errors.any?
            render json: @child_profile.errors, status: :unprocessable_entity 
        else
            render json: @child_profile, include: {wish_list: {
                                                    include: :wishes},
                                                    }, 
                                        status: 201
        end
    end

    def show
        render json: @child_profile.transform_child
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
        @child_profile.destroy
        render json: 204
    end

    private
    def child_profile_params
        params.permit(:child_profile, :id, 
            :name, 
            :wish_list_id,
            wish_list_params:[:id,
                            :name,
                            wish_params: %i[name]]
        )
    end

    def set_child_profile
        begin
        @child_profile = ChildProfile.find(params[:id])
        rescue
            render json: {error: "Child is not found"}, status: 404
        end
    end

    def check_ownership
        if current_user.id != @child_profile.user.id
            render json: {error: "You don't have permission to do that"}, status: 401
        end
    end
end
