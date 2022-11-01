class Candidate
  attr_reader :name
  def initialize(info)
    @name = info[:name]
    @party = info[:party]
  end
end
