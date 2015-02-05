class IncomingController < ApplicationController
# https://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # take a look at these in my server logs through running $ heroku logs --tail
    # to get a sense of what I'm dealing with dummy
    puts "INCOMING PARAMS HERE: #{params}"

    # I can put the message-splitting and business ass-magic here
      #find the user by using params[:sender]
      
      @user = User.find_by_email(params["sender"])
      #find the topic by using params[:subject]
      @topic = Topic.find_by_title(params["subject"])
      # assign the url to a variable after retrieving it from params["body-plain"]

      # Check if user is nil, if so, create and save a new user
      if @user = nil
        user = User.new(email: params["sender"])
        user.save!  
      end
      
      # Check if the topic is nil, if so, create and save a new topic
      if @topic = nil
        topic = Topic.new(title: params["subject"])
        topic.save!
      end
      #Now that we're sure we have a valid user and topic, build and save a new bookmark
      bookmark = Bookmark.new(title: params["title"])
      bookmark.save!
      #assuming all went well, which it probably didn't
      head 200
  end
end
