class QuestionsController < ApplicationController
    before_action :set_question, only: [:show]
    def index
        @questions = Question.all
        render json: @questions
    end

    def create
        @question = Question.create(question_params)
        if @question.errors.any?
            render json: @question.errors, status: :unprocessable_entity 
        else
            render json: @question, status: 201
        end
    end

    def show
        render json: @question
    end

    private
    def question_params
        params.permit(:question, :answer)
    end

    def set_question
        @question = Question.find(params[:id])
    end
end
