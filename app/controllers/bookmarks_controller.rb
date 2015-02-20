class BookmarksController < ApplicationController
  def show
    # @topic = Topic.where(topic_id: params[:topic_id])   ====> [topic1, topic2, topic3....]
    @bookmark = Bookmark.find(params[:id])
    @bookmarks = Bookmark.all
    #authorize @bookmark
    @topic = @bookmark.topic
    

    # if request.path != bookmark_path(@bookmark)
    #   redirect_to @bookmark, status: :moved_permanently
    # end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    #@topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    authorize @bookmark

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params[:bookmark].permit!)
    @bookmark.topic = @topic
    @bookmark.user = current_user
    authorize @bookmark

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
    
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "shits destroyed"
      redirect_to topics_path
    else
      flash[:error] = "something happened, try again."
      redirect_to topics_path
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.update(params[:bookmark].permit!)
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving, try again."
      render :edit
    end
  end
end



