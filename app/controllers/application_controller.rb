class ApplicationController < ActionController::API
  include ActionController::Serialization
  serialization_scope :current_player

  def current_player
    @current_player ||= Player.find_by(api_key: params[:api_key])
    pp "@current_player"
    pp @current_player
  end

  private

    def authenticate_player!
      if !current_player
        render json: {status: 'You need to sign in for access to this resource.'}
      end
    end

    def admin_only!
      authenticate_player!
      if !current_player.admin?
        render json: {status: 'You do not have access to this resource.'}
      end
    end

    def admin_or_correct_player!
      @player = Player.find(params[:id])
      unless current_player == @player || current_player.admin?
        render json: {status: 'You do not have access to this resource.'}
      end
    end

end
