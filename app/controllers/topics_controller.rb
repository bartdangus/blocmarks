class TopicsController < ApplicationController
 
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    @bookmarks = Bookmark.all
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved."
    else 
      flash[:error] = "Error, please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def destroy
    @topic =Topic.find(params[:id])
    title = @topic.title
    authorize @topic

    if @topic.destroy
      flash[:notice] = "\"#{title}\" was deleted. "
      redirect_to topics_path
    else
      flash[:error] = "There was en error, try again."
      redirect_to :show
    end
  end
end
