require_relative '../grid_parser.rb'

class String
  def strip_heredoc
    gsub(/^#{scan(/^[ \t]*(?=\S)/).min}/, ''.freeze)
  end
end

RSpec.describe GridParser do
  describe ".parse" do
    it "returns a Grid with" do
      filename = 'path/to/file.txt'
      input_board = <<-TEXT.strip_heredoc
        2 2
        .*
        **
      TEXT

      allow(File).to receive(:read).with(filename).and_return input_board

      grid = GridParser.parse(filename)

      expect(grid.cell_at(0, 0)).to_not be_alive
      expect(grid.cell_at(0, 1)).to be_alive
      expect(grid.cell_at(1, 0)).to be_alive
      expect(grid.cell_at(1, 1)).to be_alive
    end
  end
end
