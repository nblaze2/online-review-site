class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
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
    @review = Review.find(params[:id])
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
    @review = Review.find(params[:id])
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
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movies_path, notice: 'Review was successfully destroyed.'
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
end
