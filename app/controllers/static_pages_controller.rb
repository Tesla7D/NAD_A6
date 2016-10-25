class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @codepost  = current_user.codeposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @feed_item = Codepost.last
    end

  end

  def about
  end
end
