class Candidate
  attr_reader :name, :party, :votes
  def initialize(info)
    @name = info[:name]
    @party = info[:party]
    @votes = 0
  end
end
