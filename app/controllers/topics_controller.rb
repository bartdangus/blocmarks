class TopicsController < ApplicationController
 
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    if @topic.save
      redirect_to @topic, notice: "Topic was saved."
    else 
      flash[:error] = "Error, please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic =Topic.find(params[:id])
    title = @topic.title

    if @topic.destroy
      flash[:notice] = "\"#{title}\" was deleted. "
      redirect_to topics_path
    else
      flash[:error] = "There was en error, try again."
      redirect_to :show
    end
  end
end
