class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error, try it again."
      render :new
    end
end

def update
  @topic = Topic.find(params[:topic_id])
  @bookmark = Bookmark.find(params[:id])
end

