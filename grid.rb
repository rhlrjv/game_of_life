require_relative 'cell.rb'

class Grid
  def initialize(bool_array)
    @gameboard = bool_array.map do |arr|
      arr.map { |b| Cell.new(b) }
    end
  end

  def cell_at(row, col)
    @gameboard[row][col]
  end

  def to_a
    @gameboard
  end
end
