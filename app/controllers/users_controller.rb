class UsersController < ApplicationController
  def show
    @count = User.count
    @user = User.find(params[:id])
    @codeposts = @user.codeposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Code tweets!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.search(params[:search])
  end

  def destroy
    log_out
    current_user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
