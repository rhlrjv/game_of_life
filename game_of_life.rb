require 'pry'
require_relative 'grid_parser.rb'
require_relative 'grid_presenter.rb'

class GameOfLife
  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_path)
    text = File.read(file_path)
    GameOfLife.new(GridParser.parse(text))
  end

  def serialize_grid
    GridPresenter.serialize(@grid)
  end
end
