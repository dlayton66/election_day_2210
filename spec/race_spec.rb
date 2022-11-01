require './lib/race'
require './lib/candidate'

RSpec.describe Race do
  let(:race1) {Race.new("Texas Governor")}
  let(:race2) {Race.new("Virginia District 4 Representative")}
  let(:race3) {Race.new("Colorado District 5 Representative")}

  it 'has an office' do
    expect(race1.office).to eq "Texas Governor"
  end

  it 'has an array of candidates' do
    expect(race1.candidates).to eq []
  end

  describe '#register_candidate!' do
    it 'adds a candidate to candidates array, then returns that candidate' do
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})

      expect(candidate1.class).to eq Candidate
      expect(candidate1.name).to eq "Diana D"
      expect(candidate1.party).to eq :democrat

      expect(race1.candidates).to eq [candidate1,candidate2]
    end
  end

  describe '#open?' do
    it 'returns a boolean indicating if the race is open' do
      expect(race1.open?).to be true
    end
  end

  describe 'winner' do
    it 'returns the winner if the race is over, otherwise false' do
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}

      expect(race1.winner).to be false

      race1.close!

      expect(race1.winner).to eq(candidate1)
    end
  end

  describe '#close!' do
    it 'closes the race' do
      race1.close!

      expect(race1.open?).to be false
    end
  end

  describe '#tie?' do
    it 'returns a boolean indicating if the race was tied' do
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      1.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      expect(race2.tie?).to be true
      expect(race1.tie?).to be false
    end
  end
end