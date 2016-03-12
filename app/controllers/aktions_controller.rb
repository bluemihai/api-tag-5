class AktionsController < ApplicationController
  before_action :set_aktion, only: [:show, :update, :destroy]

  # GET /aktions
  def index
    @aktions = Aktion.all

    render json: @aktions
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
      render json: @aktion.errors, status: :unprocessable_entity
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
      params.require(:aktion).permit(:timeslot, :focus, :player_id)
    end
end
