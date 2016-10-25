class CodepostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @codeposts = Codepost.all
  end

  def create
    @codepost = current_user.codeposts.build(codepost_params)
    if @codepost.save
      flash[:success] = "Codepost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @codepost.destroy
    flash[:success] = "Codepost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def codepost_params
      params.require(:codepost).permit(:title, :html, :css)
    end

    def correct_user
      @codepost = current_user.codeposts.find_by(id: params[:id])
      redirect_to root_url if @codepost.nil?
    end
end
