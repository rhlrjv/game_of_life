require 'pry'
require 'aruba/rspec'
require_relative '../game_of_life.rb'

class String
  def strip_heredoc
    gsub(/^#{scan(/^[ \t]*(?=\S)/).min}/, ''.freeze)
  end
end

RSpec.describe "Acceptance test", type: :aruba do
  xit "reads a board from a file and prints out the next generation" do
    input_board = <<-TEXT.strip_heredoc
    4 8
    ........
    ....*...
    ...**...
    ........
    TEXT

    output_board = <<-TEXT.strip_heredoc
    4 8
    ........
    ...**...
    ...**...
    ........
    TEXT

    write_file 'input.txt', input_board
    run './game_of_life.rb'
    stop_all_commands

    expect(last_command_started.stdout).to eq output_board
  end
end

RSpec.describe GameOfLife do
  describe "#initialize" do
    it "assigns @board to parsed input file" do
      filename = 'path/to/input.txt'
      grid = double(:grid)
      allow(GridParser).to receive(:parse).with(filename).and_return grid

      gol = GameOfLife.new(filename)
      expect(gol.instance_variable_get(:@board)).to eq grid
    end
  end
end
