class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @list.save && @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def bookmark_params
    params.require(:list).require(:bookmark).permit(:movie_id, :comment)
  end
end
