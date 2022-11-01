require './lib/race'
require './lib/candidate'

RSpec.describe do
  let(:race) {Race.new("Texas Governor")}

  it 'has an office' do
    expect(race.office).to eq "Texas Governor"
  end

  it 'has an array of candidates' do
    expect(race.candidates).to eq []
  end

  describe '#regiser_candidate!' do
    it 'adds a candidate to candidates array, then returns that candidate' do
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

      expect(candidate1.class).to eq Candidate
      expect(candidate1.name).to eq "Diana D"
      expect(candidate1.party).to eq :democrat

      expect(race.candidates).to eq [candidate1,candidate2]
    end

  end
end