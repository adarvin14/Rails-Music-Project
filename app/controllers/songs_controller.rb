class SongsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
       if params[:category_id]
        @songs = Category.find(params[:category_id]).songs 
       else
        @songs = current_user.songs
       end
    end

    def show
        @song = current_user.songs.find_by(id: params[:id])
        if !@song
            redirect_to category_path
        end

    end

    def new
        if params[:category_id] && @category = Category.find_by(id: params[:category_id])
            @song = @category.songs.build
        else
            @song = Song.new
        end

    def edit
        @song = Song.find_by(id: params[:id])
    end

    def create
        @song = current_user.songs.build(song_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def update
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit 
        end
    end

    def destroy
        @song.destroy 
        redirect_to songs_path
    end

    private

    def song_params 
        params.require(:song).permit(:title, :release_year, :artist, :album, :genre, :user_id, :category_id, category_attributes: [ :name ])
    end
end
