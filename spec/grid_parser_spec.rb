require_relative '../grid_parser.rb'

RSpec.describe GridParser do
  describe ".parse" do
    it "returns a Grid from input string" do
      input_board = <<-TEXT.strip_heredoc
        2 2
        .*
        **
      TEXT

      grid = GridParser.parse(input_board)

      expect(grid.cell_at(0, 1)).to be_alive
      expect(grid.cell_at(1, 0)).to be_alive
      expect(grid.cell_at(1, 1)).to be_alive
    end
  end
end
