class UsersController < ApplicationController
  def show
  @bookmark = Bookmark.find(params[:user_id])
  @likes = Bookmark.find(params[:user_id])
  end
end
