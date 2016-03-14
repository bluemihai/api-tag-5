require 'rails_helper'

RSpec.describe PlayerSerializer, :type => :model do  
  before(:each) do
    @player = FactoryGirl.create(:player, id: 42)
    @scope = FactoryGirl.create(:player, role: 'user')
    @serializer = PlayerSerializer.new(@player, scope: @scope)
    @json = @serializer.attributes.as_json
  end

  ['name', 'email'].each do |attr|
    describe attr do
      it 'is present in the json' do
        expect(@json[attr]).to eq @player.send(attr)
      end
    end
  end

  describe '#token' do
    context 'as an admin' do
      it 'is included in the json and equal to #api_key' do
        admin = FactoryGirl.create(:player, role: 'admin')
        serializer = PlayerSerializer.new(@player, scope: admin)
        json = serializer.attributes.as_json
        expect(serializer.scope.admin?).to eq(true)
        expect(json['token']).to eq(@player.api_key)
      end
    end
    
    context 'as a non-admin' do
      it 'is nil' do
        expect(@serializer.scope.admin?).to eq(false)
        expect(@json['token']).to be_nil
      end
    end
  end

end
