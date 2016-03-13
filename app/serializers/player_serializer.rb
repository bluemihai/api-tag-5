class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role, :fictional, :token
  has_many :aktions

  delegate :current_player, to: :scope

  def token
    return object.api_key if scope && scope.admin?
  end

end
