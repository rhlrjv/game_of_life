require_relative '../grid.rb'

describe Grid do
  describe "#cell_at" do
    it "returns a cell at the coordinates" do
      grid = Grid.new([[true, false]])

      expect(grid.cell_at(0, 0)).to be_alive
      expect(grid.cell_at(0, 1)).to_not be_alive
    end
  end

  describe "#to_a" do
    it "returns the matrix of cells" do
      arr = Grid.new([[true, false]]).to_a

      expect(arr.size).to eq 1
      expect(arr[0].size).to eq 2
      expect(arr[0][0]).to be_alive
      expect(arr[0][1]).to_not be_alive
    end
  end
end

