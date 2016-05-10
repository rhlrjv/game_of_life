require 'pry'
require_relative 'grid_parser.rb'
require_relative 'grid_presenter.rb'

class GameOfLife
  def initialize(file_path)
    @grid = GridParser.parse(file_path)
  end

  def serialize_grid
    GridPresenter.serialize(@grid)
  end
end
