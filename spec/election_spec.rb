require './lib/race'
require './lib/candidate'
require './lib/election'

RSpec.describe Election do
  let(:election) {Election.new('2022')}

  it 'has a year' do
    expect(election.year).to eq '2022'
  end

  it 'stores election races' do
    expect(races).to eq []
  end
end