class CommentsController < ApplicationController
    def create
        user = User.find(session[:user_id])
        question = Question.find(params[:id])
        comment = user.comments.build(question_id: question.id)
        comment.content = params[:comment][:content]
        comment.save
        redirect_to question_path(question.id)
    end
end
