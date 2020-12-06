class GenresController < ApplicationController
    before_action :authenticate_user!

    def index
        @genres = current_user.genres 
    end

    def show
        @genres = Genre.find_by(id: params[:id])
        render :show
    end 

    def new
        @genre = Genre.new(id)
        @song = @genre.songs.build
    end

    def create
        @genre = current_user.genres.build(genre_params)
        
        if @genre.save
            redirect_to genre_path(@genre)
        else
            render :new 
        end 
    end

    def edit 
        @genre = Genre.find_by(id: params[:id])
    end 

    def update
        @genre = current_user.genres.update(genre_params)

        if @genre
            redirect_to genre_path
        else 
            render :edit
        end 
    end 

    def delete
        @genre = current_user.genres.find_by(id: params[:id])
        
        if @genre
            @genre.destroy 
        end 
        
        redirect_to genres
    end 


    private 

    def genre_params
        params.require(:genre).permit(:name, :user_id, :genre_id)
    end 
end
