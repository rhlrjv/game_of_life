require_relative 'cell.rb'

class Grid
  def initialize(cell_array)
    @gameboard = cell_array
  end

  def self.from_bool_array bool_array
    cell_array = bool_array.map do |arr|
      arr.map { |b| Cell.new(b) }
    end
    Grid.new(cell_array)
  end

  def cell_at(row, col)
    @gameboard[row][col]
  end

  def to_a
    @gameboard
  end

  def next_generation
    cell_array = @gameboard.each_with_index.map do |row, i|
      row.each_with_index.map do |cell, j|
        cell.evolve(living_neighbors_count(i, j))
      end
    end
    Grid.new(cell_array)
  end

  private

  def row_count
    @row_count ||= @gameboard.size
  end

  def col_count
    @col_count ||= @gameboard[0].size
  end

  def within_range?(row, col)
    ((0...row_count).include? row )&&
      ((0...col_count).include? col )
  end

  def neighbors(row, col)
    neighbouring_cells = []
    for i in (row-1 .. row+1)
      for j in (col-1 .. col+1)
        next if !within_range?(i, j)
        #next if [i,j] == [row, col] || !within_range?(i, j)
        neighbouring_cells << @gameboard[i][j]
      end
    end
    neighbouring_cells
  end

  def living_neighbors_count(row, col)
    neighbors(row, col).select(&:alive?).count
  end
end
