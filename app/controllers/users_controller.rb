class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def create
        @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id
            redirect_to "/songs/"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/"
    end
  end

  def new
    @user = User.new
  end

def show
  @user = User.find(params[:id])
  @songs =  @user.songs
  # @secretsL = @user.secrets_liked
  # binding.pry
end

def destroy
  reset_session
  @user = User.find(params[:id]).destroy
  redirect_to '/'
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
