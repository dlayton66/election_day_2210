require './lib/candidate'

RSpec.describe Candidate do
  let(:diana) {Candidate.new({name: "Diana D", party: :democrat})}

  it 'has a name' do
    expect(diana.name).to eq "Diana D"
  end
end