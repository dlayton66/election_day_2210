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
end