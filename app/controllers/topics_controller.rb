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
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic =Topic.find_by_title(params["subject"])
  end
end
