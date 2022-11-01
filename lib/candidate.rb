class Candidate
  attr_reader :name, :party
  def initialize(info)
    @name = info[:name]
    @party = info[:party]
  end
end
