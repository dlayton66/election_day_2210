class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    candidates = []
    races.each do |race|
      candidates += race.candidates
    end
    candidates
  end

  def vote_counts
    vote_counts = {}
    races.each do |race|
      race.candidates.each do |candidate|
        vote_counts[candidate.name] = candidate.votes
      end
    end
    vote_counts
  end
end
