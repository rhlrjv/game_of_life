require_relative 'cell.rb'

class Grid
  def initialize(cell_array)
    @gameboard = cell_array
  end

  def self.from_bool_array bool_array
    cell_array = bool_array.each_with_index.map do |arr, row|
      arr.each_with_index.map { |alive, col| Cell.new(row, col, alive) }
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
    cell_array = @gameboard.map do |row|
      row.map do |cell|
        cell.evolve(living_neighbors_count(cell.row, cell.col))
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
