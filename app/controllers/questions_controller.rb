class QuestionsController < ApplicationController
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

    private
    def question_params
        params.permit(:question, :answer)
    end
end
