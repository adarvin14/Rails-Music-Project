class GamesController < ApplicationController
    before_action :authenticate_user!

    def index
       if params[:category_id]
        @games = Category.find(params[:category_id]).games 
       else
        @games = current_user.games
       end
    end

    def show
        @game = current_user.games.find_by(id: params[:id])
        if !@game
            redirect_to category_path
        end

    end

    def new
        if params[:category_id] && @category = Category.find_by(id: params[:category_id])
            @game = @category.games.build
        else
            @game = Game.new
        end

    def edit
        @game = Game.find_by(id: params[:id])
    end

    def create
        @game = current_user.games.build(game_params)
        if @game.save
            redirect_to @game
        else
            render :new
        end
    end

    def update
        if @game.update(game_params)
            redirect_to @game
        else
            render :edit 
        end
    end

    def destroy
        @game.destroy 
        redirect_to games_path
    end

    private

    def game_params 
        params.require(:game).permit(:title, :release_year, :hours_played, :online_multiplayer, :campaign, :campaign_completed, :user_id, :category_id, category_attributes: [ :name ])
    end
end
