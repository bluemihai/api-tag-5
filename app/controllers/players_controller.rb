class PlayersController < ApplicationController
  before_action :admin_only!, only: [:index]
  before_action :set_player, only: [:show, :update, :destroy]
  before_action :admin_or_correct_player!, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:name, :role, :email, :current_time_zone, :email, :fictional,
        :current_team_id, :sound_choice, :ticking_volume, :warning_volume, :api_key,
        :review_before_relax, :commit_length, :show_insights, :show_sidebars, :show_rubric, 
        :dancing, :soccer)
    end


end
