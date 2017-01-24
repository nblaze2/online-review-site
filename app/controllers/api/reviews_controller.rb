# class Api::ReviewsController < Api::ApiController
#   def upvote
#     @review = Review.find(params[:review_id])
#     @review.votes.create
#     vote = Vote.find_by(user: current_user, review: @review)
#     if vote.score <= 0
#       vote.score += 1
#       vote.save
#     elsif vote.nil?
#       Vote.create!(user: current_user, review: @review, score: 1)
#     end
#     redirect_to @review.movie
#   end
#
#   def downvote
#     @review = Review.find(params[:review_id])
#     @review.votes.create
#     vote = Vote.find_by(user: current_user, review: @review)
#     if vote.score >= 0
#       vote.score -= 1
#       vote.save
#     elsif vote.nil?
#       Vote.create!(user: current_user, review: @review, score: -1)
#     end
#     redirect_to @review.movie
#   end
# end
