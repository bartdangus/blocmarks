class LikesController < ApplicationController

def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark_id: @bookmark.id)
  @bookmark.topic = @topic
  #authorize @like

  if like.save
    flash[:notice] = "You liked this big time."
    redirect_to @bookmark

  else
    flash[:error] = "Looks like you didn't like it enough."
    redirect_to @bookmark
  end
end

def destroy
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark_id: @bookmark.id)
  #authorize @like

  if like.destroy
    flash[:notice] = "You unliked this"
    redirect_to @bookmark

  else
    flash[:error] = "You didn't unlike this hard enough"
    redirect_to @bookmark
  end
end

def new
  @like = Like.new
end


end
