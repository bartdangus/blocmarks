class UsersController < ApplicationController
  
  def show
    #@bookmark = Bookmark.find(params[:id])
    
    @topic = Topic.find(params[:topic_id])
   @topic = @bookmark.topic
    @bookmarks = Bookmark.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])  #This gives you all the user's likes
    end
  end

