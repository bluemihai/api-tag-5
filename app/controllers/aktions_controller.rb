class AktionsController < ApplicationController
  # before_action :authenticate_player!, except: [:index]
  # before_action :set_aktion, only: [:show, :update, :destroy]

  # GET /aktions
  def index
    @aktions = current_player.actions.last(20)

    render json: @aktions, status: :created
  end

  # GET /aktions/1
  def show
    render json: @aktion
  end

  # POST /aktions
  def create
    @aktion = Aktion.new(aktion_params)

    if @aktion.save
      render json: @aktion, status: :created, location: @aktion
    else
      render json: {unprocessable_entity: 'Could not save your Action, likely because you already had one in this timeslot'}
    end
  end

  # PATCH/PUT /aktions/1
  def update
    if @aktion.update(aktion_params)
      render json: @aktion
    else
      render json: @aktion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aktions/1
  def destroy
    @aktion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aktion
      @aktion = Aktion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def aktion_params
      params.require(:aktion).permit(:timeslot, :focus, :player_id, :verb_id, :project_id, :flow, 
        :flow_notes, :value, :value_notes, :visible_to, :status, :intensity, :how_it_went, :music,
        :time_zone, :location_id, :role_id, :properties, :team_id, :water, :breaths, :pushups, :situps,
        :wallsits, :choice, :snack, :tidy, :stop, :restroom, :stretch, :games, :friends, :other,
        :change, :planned_date, :planned_sequence_number, :planned, :deflected, :jumpjacks, :chairdips,
        :distractions, :recovered, :started_at, :stopped_at, :declared_focus, :awesome_break, :tight_focus,
        :reading, :podcast)
    end
end
