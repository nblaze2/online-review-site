class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
  end

  # GET /reviews/1/edit
  def edit
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.save
      redirect_to @movie, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.update(review_params)
      redirect_to @movie, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to movies_path, notice: 'Review was successfully destroyed.'
  end

  def upvote
    @review = Review.find(params[:review_id])
    @review.votes.create
    vote = Vote.find_by(user: current_user, review: @review)
    if vote.nil?
      Vote.create!(user: current_user, review: @review, score: 1)
    elsif vote.score <= 0
      vote.score += 1
      vote.save
    end
    redirect_to @review.movie
  end

  def downvote
    @review = Review.find(params[:review_id])
    @review.votes.create
    vote = Vote.find_by(user: current_user, review: @review)
    if vote.nil?
      Vote.create!(user: current_user, review: @review, score: -1)
    elsif vote.score >= 0
      vote.score -= 1
      vote.save
    end
    redirect_to @review.movie
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:title, :body, :user_id, :movie_id, :rating)
    end

    def authenticate_user
      if !user_signed_in?
        redirect_to new_user_session_path, notice: "You must be logged in."
      end
    end

    def authorize_user
      if @review.user != current_user
        if !current_user.admin?
          redirect_to movie_path(@movie), notice: "You are not authorized to make those changes."
        end
      end
    end
end
