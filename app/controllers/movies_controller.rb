class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order("created_at DESC")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      redirect_to movie_path(@movie), alert: "Saved!"
    else
      render 'new', alert: "Error! Not Saved!"
    end
  end

  def show
    @movie = Movie.find params[:id]
  end

  def edit

  end

  def update
    if @movie.update movie_params
      redirect_to movie_path(@movie)
    else
      render 'edit', alert: "Error! Not Updated!"
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :year, :description, :director)
  end

  def find_movie
    @movie = Movie.find params[:id]
  end

end
