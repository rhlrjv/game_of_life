require_relative '../grid_presenter.rb'

class String
  def strip_heredoc
    gsub(/^#{scan(/^[ \t]*(?=\S)/).min}/, ''.freeze)
  end
end

RSpec.describe GridPresenter do
  describe ".serialize" do
    it "returns a string representation of the grid" do
      grid = Grid.new([
        [false, true],
        [true, true],
      ])
      serialized_string= <<-TEXT.strip_heredoc
        2 2
        .*
        **
      TEXT

      expect(GridPresenter.serialize(grid)).to eq serialized_string
    end
  end
end
