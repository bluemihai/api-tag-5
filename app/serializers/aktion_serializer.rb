class AktionSerializer < ActiveModel::Serializer
  attributes :id, :focus, :timeslot
  belongs_to :player
  
  def default_serializer_options
    {root: true}
  end
end
