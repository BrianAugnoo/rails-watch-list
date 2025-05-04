class ListsController < ApplicationController
  before_action :find_list, only: [ :show, :edit, :destroy ]
  def index
    @lists = List.all
  end

  def show
    @movies = @list[:movies]
    @movies_filed = !@movies.nil?
    @all_movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(create_params)
    if @list.save
      redirect_to lists_path(List.all)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    raise
  end

  def destroy
    if @list.destroy
      flash[:notice] = "bro are dead!💀"
      redirect_to lists_path(List.all)
    else
      flash[:alert] = "bro survived!!!😭"
      render :index
    end
  end

  private

  def create_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
