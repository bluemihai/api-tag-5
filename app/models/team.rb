class Team < ActiveRecord::Base
  has_many :roles, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :aktions
  has_many :team_memberships, dependent: :destroy
  has_many :players, through: :team_memberships
  belongs_to :creator, class_name: 'Player', required: false

  default_scope { order(:updated_at) }

  def team_and_name
    'Team: ' + name
  end

  def short_safe
    short || name
  end

  def add(playa)
    tm = team_memberships.create!(player_id: playa.id)
    tm ? {notice: 'Successfully added you to this team'} : {alert: 'Unable to add you to this team'}
  end

  def self.initialize_for(playa)
    return playa.teams.first if playa.teams.first
    return 'Player not yet saved' if playa.new_record?
    t = playa.teams.create!(creator_id: playa.id, name: playa.first_name.to_s + ' Enterprises', default_color: '#CCFFCC', short: playa.initials)
    playa.preferences[:first_team_id] = t.id
    t
  end

  def remove(playa)
    tm = TeamMembership.where(player_id: playa.id, team_id: self.id).first
    return {notice: 'Team Membership not found'} unless tm
    tm.destroy ? {notice: 'Successfully removed you from this team'} : {alert: 'Unable to remove you from this team'}
  end

  def roles_api_url(api_key, player_id)
    if name == 'HolacracyOne'
      "https://glassfrog.holacracy.org/api/v3/roles?person_id=#{player_id}&api_key=#{api_key}"
    else
      "Sorry, no roles API URL has been provided for this team."
    end
  end

  def membership_for(playa)
    TeamMembership.find_by(team_id: id, player_id: playa.id)
  end

  def color(playa)
    return 'black' unless playa
    tm = TeamMembership.find_by(team_id: self.id, player_id: playa.id)
    tm.try(:color) || default_color
  end
end
