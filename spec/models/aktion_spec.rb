require 'rails_helper'

RSpec.describe Aktion, :type => :model do  
  before(:each) do
    @player = FactoryGirl.create(:player)
    @aktion = FactoryGirl.create(:aktion, player: @player, team: @player.first_team)
  end

  subject { @aktion }

  it { should respond_to(:focus) }

  it 'should create 1 aktion and 1 player by default' do |variable|
    expect(Player.count).to eq(1)
    expect(Aktion.count).to eq(1)
  end

end
