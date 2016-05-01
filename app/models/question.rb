class Question < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :commenters, through: :comments, source: :user
end
