class Cell
  def initialize alive
    @alive = alive
  end

  def alive?
    @alive
  end

  def ==(other_cell)
    other_cell.alive? == alive?
  end

  def evolve live_neighbor_count
    alive_in_next_gen = if alive?
      [2, 3].include? live_neighbor_count
    else
      live_neighbor_count == 3
    end

    Cell.new(alive_in_next_gen)
  end
end

