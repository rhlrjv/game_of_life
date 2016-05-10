require 'pry'
require_relative '../game_of_life.rb'

RSpec.describe GameOfLife do
  describe "#initialize" do
    it "assigns @board to parsed input file" do
      filename = 'path/to/input.txt'
      grid = double(:grid)
      allow(GridParser).to receive(:parse).with(filename).and_return grid

      gol = GameOfLife.new(filename)
      expect(gol.instance_variable_get(:@grid)).to eq grid
    end
  end
end
