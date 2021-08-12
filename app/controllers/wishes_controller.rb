class WishesController < ApplicationController
    before_action :set_wish, only: [:show, :update, :destroy]
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

    def update
        @wish.update(wish_params)
        if @wish.errors.any?
            render json: @wish.errors, status: :unprocessable_entity 
        else
            render json: @wish, status: 201
        end
    end

    def destroy
        @wish.destroy
        render json: 204
    end

    def show
        render json: @wish
    end

    private
    def wish_params
        params.permit(:id, :name, :wish, :wish_list_id)
    end

    def set_wish
        begin
            @wish = Wish.find(params[:id])
        rescue
            render json: {error: "Wish is not found"}, status: 404
        end
    end
end
