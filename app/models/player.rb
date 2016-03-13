class Player < ApplicationRecord
  has_many :aktions
  enum role: [:user, :admin]

  before_create do |player|
    player.api_key = player.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Player.exists?(api_key: token)
    end
  end
end
