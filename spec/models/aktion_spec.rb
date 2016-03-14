require 'rails_helper'

RSpec.describe Aktion, :type => :model do  
  before(:each) do
    @player = FactoryGirl.create(:player)
    @aktion = FactoryGirl.create(:aktion, player: @player, team: @player.teams.first)
  end

  subject { @aktion }

  it { should respond_to(:focus) }

  it 'should add current timeslot when created without an explicit one' do
    expect(@aktion.timeslot).to eq(Aktion.current_timeslot)
  end

  it 'should be invalid with player-duplicate timeslot' do
    new_action = FactoryGirl.build(:aktion, player: @player, timeslot: Aktion.current_timeslot)
    expect(new_action.valid?).to be false
  end

  it 'should be invalid without team_id' do
    a = FactoryGirl.build(:aktion)
    expect(a.valid?).to be false
    expect(a.errors.messages).to eq({team_id: ['can\'t be blank'], team: ['must exist']})
  end

end
