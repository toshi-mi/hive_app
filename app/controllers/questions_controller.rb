class QuestionsController < ApplicationController
    def new
        @question = Question.new
    end
    
    def create
        user = User.find_by(id: session[:user_id])
        question = user.questions.build(question_params)
        question.save
        redirect_to questions_path
    end
    
    def index
        @questions = Question.all
    end
    
    def show
        @question = Question.find(params[:id])
        @comment = Comment.new
        @comments = @question.comments
    end
    
    private
    def question_params
        params.require(:question).permit(:title, :content)
    end
end
