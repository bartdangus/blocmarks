class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmarks = Bookmark.all
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
    @bookmark = Bookmark.new(params[:bookmark].permit!)
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error, try it again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    

    if @bookmark.destroy
      flash[:notice] = "shits destroyed"
      redirect_to topics_path
    else
      flash[:error] = "something happened, try again."
      redirect_to topics_path
    end
  end
end

def update
  @topic = Topic.find(params[:topic_id])
  @bookmark = Bookmark.find(params[:id])
end

