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

  describe '#candidates' do
    it 'returns an array of all candidates across all races' do
      election.add_race(race1)
      election.add_race(race2)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

      expect(election.candidates).to eq [candidate1,candidate2,candidate3,candidate4,candidate5]
    end
  end
end