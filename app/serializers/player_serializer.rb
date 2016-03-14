class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :last_active, :total_actions,
  :gravatar

  delegate :current_player, to: :scope

  def token
    return object.api_key if scope && scope.admin?
  end

  def total_actions
    object.actions.count
  end
end
