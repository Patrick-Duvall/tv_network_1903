#unsure on exact whitespacing conventions

class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    all_charachters = @shows.map(&:characters).flatten
    highest_paid_charachter = all_charachters.max_by{|char| char.salary}
    highest_paid_charachter.actor
  end

  def payroll
      all_charachters = @shows.map(&:characters).flatten
      retval = {}
      all_charachters.each{|char| retval[char.actor] = char.salary}
      retval
    end

end
