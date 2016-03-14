class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :last_active, :total_actions,
  :gravatar, :token, :current_time_zone, :projects, :teams

  delegate :current_player, to: :scope

  def token
    return object.api_key if scope && scope.admin?
  end

  def total_actions
    object.actions.count
  end

  def projects
    object.projects.count
  end

  def teams
    object.teams.count
  end
end
