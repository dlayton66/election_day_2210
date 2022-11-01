require './lib/candidate'

RSpec.describe Candidate do
  let(:diana) {Candidate.new({name: "Diana D", party: :democrat})}

  it 'has a name' do
    expect(diana.name).to eq "Diana D"
  end

  it 'has a party' do
    expect(diana.party).to eq :democrat
  end

  it 'keeps a tally of votes' do
    expect(diana.votes).to eq 0
  end

  describe '#vote_for!' do
    it 'increases votes by 1' do
      diana.vote_for!
      diana.vote_for!
      diana.vote_for!
      
      expect(diana.votes).to eq 3

      diana.vote_for!
      expect(diana.votes).to eq 4
    end
  end
end