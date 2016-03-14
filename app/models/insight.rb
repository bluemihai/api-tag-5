class Insight < ActiveRecord::Base
  belongs_to :aktion, required: false
  belongs_to :player
end
