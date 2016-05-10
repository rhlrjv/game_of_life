require 'set'
require_relative 'cell.rb'

class Grid
  def initialize(row_count, col_count, cells)
    @row_count = row_count
    @col_count = col_count
    @cells = cells
  end

  def self.from_bool_array bool_array
    cells = Set.new
    bool_array.each_with_index do |row, row_number|
      row.each_with_index do |alive, col_number|
        cells.add Cell.new(row_number, col_number, alive) if alive
      end
    end
    Grid.new(bool_array.size, bool_array[0].size, cells)
  end

  def cell_at(row, col)
    @cells.detect { |cell| cell.row == row && cell.col == col }
  end

  def to_a
    arr = []
    @row_count.times do |row|
      row_arr = []
      @col_count.times do |col|
        row_arr << (cell_at(row, col) || Cell.new(row, col, false))
      end
      arr << row_arr
    end
    arr
  end

  def next_generation
    all_affected_cells = @cells.reduce(@cells.dup) do |acc, cell|
      acc.merge(neighbors(cell.row, cell.col))
    end

    cells = all_affected_cells.map do |cell|
      cell.evolve(living_neighbors_count(cell.row, cell.col))
    end.select(&:alive?) # TODO write test for this
    Grid.new(@row_count, @col_count, cells.to_set)
  end

  private

  def neighbors(row, col)
    neighbouring_cells = Set.new
    (row - 1..row + 1).each do |i|
      (col - 1..col + 1).each do |j|
        next if [i, j] == [row, col] # TODO write test for this
        neighbouring_cells.add(cell_at(i, j) || Cell.new(i, j, false))
      end
    end
    neighbouring_cells
  end

  def living_neighbors_count(row, col)
    neighbors(row, col).select(&:alive?).count
  end
end
