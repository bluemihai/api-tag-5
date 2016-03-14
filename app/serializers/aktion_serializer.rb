class AktionSerializer < ActiveModel::Serializer
  attributes :id, :focus, :timeslot, :timezone, :time
  belongs_to :player
  
  def default_serializer_options
    {root: true}
  end

  def timezone
    scope.current_time_zone || 'Hawaii'
  end

  def time
    object.timeslot.in_time_zone(timezone)
  end

end
