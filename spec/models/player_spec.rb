require 'rails_helper'

RSpec.describe Player, :type => :model do  
  before(:each) do
    @player = FactoryGirl.create(:player)
  end

  subject { @player }

  it { should respond_to(:name) }

end
