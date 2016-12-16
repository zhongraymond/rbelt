class SongsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      # binding.pry
      redirect_to "/songs/"
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to "/songs/"
    end
  end

  def show
    @user = User.find(session[:user_id])
    @playlists = Playlist.select("user_id, first_name, last_name").joins(:user).group("user_id, first_name, last_name").where(song_id:params[:id])
    @playlists1 = Playlist.all.joins(:user).where(song_id:params[:id])
    # @users1 = User.select("user_id").joins(:playlists).distinct("user_id").count
    # @playlist = Playlist.all.group(:user_id).where(song_id:1)
    @song = Song.find(params[:id])
        # binding.pry
    # playlists.where(song_id:params[:id])

    # @playlists =  @.users_added
    # binding.pry
    @users = User.all
    # @song1 = Song.where(song_id:params[:id])
    # @playlists=Playlist.where(song_id:params[:id])
    # @songs =  @user.songs
  end

  def add
    # binding.pry
  @add = Playlist.new(user_id:session[:user_id],song_id:params[:id])
    if @add.save
      # binding.pry
      redirect_to "/songs/"
  else
    flash[:errors] = @add.errors.full_messages
    redirect_to "/songs/"
  end
    end

  private
  def song_params
    params.require(:song).permit(:title, :artist, :user_id)
  end
end
