class ApplicationController < ActionController::API
  include ActionController::Serialization
  serialization_scope :current_player

  def current_player
    @current_player ||= Player.find_by(api_key: params[:api_key])
  end
end
