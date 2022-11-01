require './lib/race'
require './lib/candidate'
require './lib/election'

RSpec.describe Election do
  let(:election) {Election.new('2022')}
  let(:race1) {Race.new("Virginia District 4 Representative")}
  let(:race2) {Race.new("Texas Governor")}

  it 'has a year' do
    expect(election.year).to eq '2022'
  end

  it 'stores election races' do
    expect(election.races).to eq []
  end

  describe '#add_race' do
    it 'adds race to races array' do
      election.add_race(race1)
      election.add_race(race2)

      expect(election.races).to eq [race1,race2]
    end
  end
end