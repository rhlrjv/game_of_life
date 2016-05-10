class Cell
  attr_reader :row, :col

  def initialize row, col, alive
    @row = row
    @col = col
    @alive = alive
  end

  def alive?
    @alive
  end

  def ==(other_cell)
    other_cell.alive? == alive? &&
      other_cell.row == row &&
      other_cell.col == col
  end

  def evolve live_neighbor_count
    alive_in_next_gen = if alive?
      [2, 3].include? live_neighbor_count
    else
      live_neighbor_count == 3
    end

    Cell.new(row, col, alive_in_next_gen)
  end
end

