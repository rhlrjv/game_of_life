require_relative '../grid.rb'

describe Grid do
  describe ".from_bool_array" do
    it "returns a Grid instance" do
      grid = Grid.from_bool_array([[true, false]])

      expect(grid.cell_at(0, 0)).to be_alive
      expect(grid.cell_at(0, 1)).to_not be_alive
    end
  end

  describe "#cell_at" do
    it "returns a cell at the coordinates" do
      grid = Grid.new([[Cell.new(true), Cell.new(false)]])

      expect(grid.cell_at(0, 0)).to be_alive
      expect(grid.cell_at(0, 1)).to_not be_alive
    end
  end

  describe "#to_a" do
    it "returns the matrix of cells" do
      arr = Grid.from_bool_array([[true, false]]).to_a

      expect(arr.size).to eq 1
      expect(arr[0].size).to eq 2
      expect(arr[0][0]).to be_alive
      expect(arr[0][1]).to_not be_alive
    end
  end

  describe "#next_generation" do
    it "returns the matrix of cells" do
      gen_0_grid = Grid.from_bool_array([[false, true],
                                         [true, true]])
      gen_1_grid = Grid.from_bool_array([[true, true],
                                         [true, true]])

      expect(gen_0_grid.next_generation).to be_a Grid
      expect(gen_0_grid.next_generation.to_a).to eq gen_1_grid.to_a
    end
  end
end

