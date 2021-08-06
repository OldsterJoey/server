class WishListsController < ApplicationController
    before_action :set_wish_list, only: [:show]
    def index
        @wish_lists = WishList.all
        render json: @wish_lists
    end

    def create
        @wish_list = WishList.create(wish_list_params)
        if @wish_list.errors.any?
            render json: @wish_list.errors, status: :unprocessable_entity 
        else
            render json: @wish_list, status: 201
        end
    end

    def show
        render json: @wish_list
    end

    private
    def wish_list_params
        params.permit(:wish_list, :answer)
    end

    def set_wish_list
        @wish_list = WishList.find(params[:id])
    end
end