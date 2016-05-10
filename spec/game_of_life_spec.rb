require 'pry'
require_relative '../game_of_life.rb'

RSpec.describe GameOfLife do
  describe ".from_file" do
    it "returns a GameOfLife instance based on grid in input file" do
      filename = 'path/to/input.txt'

      grid_string = <<-TEXT.strip_heredoc
      3 3
      ..*
      .*.
      *..
      TEXT

      allow(File).to receive(:read).with(filename).and_return grid_string

      gol = GameOfLife.from_file(filename)
      expect(gol.instance_variable_get(:@grid)).to be_a Grid
    end
  end

  describe "#evolve" do
    it "updates the Grid with next generation" do
      gen_0_grid = Grid.from_bool_array([[false, true],
                                         [true, true]])
      gen_1_grid = Grid.from_bool_array([[true, true],
                                         [true, true]])

      gol = GameOfLife.new(gen_0_grid)
      expect { gol.evolve }.to change { gol.instance_variable_get(:@grid).to_a }
        .from(gen_0_grid.to_a)
        .to(gen_1_grid.to_a)
    end
  end
end
