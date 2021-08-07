class WishListsController < ApplicationController
    before_action :set_wish_list, only: [:show, :update, :destroy]
    def index
        @wish_lists = WishList.all
        render json: @wish_lists, include:["wishes"]
    end

    def create
        @wish_list = WishList.create(wish_list_params)
        if @wish_list.errors.any?
            render json: @wish_list.errors, status: :unprocessable_entity 
        else
            render json: @wish_list, status: 201
        end
    end

    def update
        @wish_list.update(wish_list_params)
        if @wish_list.errors.any?
            render json: @wish_list.errors, status: :unprocessable_entity 
        else
            render json: @wish_list, status: 201
        end
    end

    def destroy
        @wish_list.delete
        render json: 204
    end

    def show
        render json: @wish_list
    end

    private
    def wish_list_params
        params.permit(:id, :name, :child_profile_id)
    end

    def set_wish_list
        begin
            @wish_list = WishList.find(params[:id])
        rescue
            render json: {error: "Wishlist is not found"}, status: 404
        end
    end
end