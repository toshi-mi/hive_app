class User < ActiveRecord::Base
    has_many :questions
    has_many :comments, dependent: :destroy
    has_many :comment_questions, through: :comments, 
    source: :question
end
