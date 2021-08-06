class WishesController < ApplicationController
    before_action :set_wish, only: [:show]
    def index
        @wishes = Wish.all
        render json: @wishes
    end

    def create
        @wish = Wish.create(wish_params)
        if @wish.errors.any?
            render json: @wish.errors, status: :unprocessable_entity 
        else
            render json: @wish, status: 201
        end
    end

    def show
        render json: @wish
    end

    private
    def wish_params
        params.permit(:wish, :answer)
    end

    def set_wish
        @wish = Wish.find(params[:id])
    end
end
