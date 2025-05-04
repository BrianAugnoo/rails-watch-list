class BookmarksController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(set_params)
    @bookmark[:list_id] = params[:list_id]
    @bookmark[:movie_id] = params[:movie_id]

    if @bookmark.save
      redirect_to list_path(List.find(params[:list_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list

    if @bookmark.delete
      flash[:notice] = "bro are dead!💀"
      redirect_to list_path(@list)
    else
      flash[:alert] = "bro survived!!!😭"
      redirect_to list_path(@list)
    end
  end

  private
  def set_params
    params.require(:bookmark).permit(:comment)
  end
end
