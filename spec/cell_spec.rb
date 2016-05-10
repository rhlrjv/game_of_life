require_relative '../cell.rb'

describe Cell do
  describe "#initialize" do
    it "stores its coordinates" do
      cell = Cell.new(3, 7, true)
      expect(cell.row).to eq 3
      expect(cell.col).to eq 7
    end
  end

  describe "#alive?" do
    context "when the cell is alive" do
      subject { Cell.new(0, 0, true) }
      specify { is_expected.to be_alive }
    end

    context "when the cell is not alive" do
      subject { Cell.new(0, 0, false) }
      specify { is_expected.to_not be_alive }
    end
  end

  describe "#==" do
    it "uses the value of alive to determine equality" do
      expect(Cell.new(1, 2, true)).to eq Cell.new(1, 2, true)
      expect(Cell.new(0, 0, false)).to eq Cell.new(0, 0, false)
      expect(Cell.new(0, 0, true)).to_not eq Cell.new(0, 0, false)
      expect(Cell.new(1, 2, true)).to_not eq Cell.new(1, 3, true)
      expect(Cell.new(1, 2, true)).to_not eq Cell.new(3, 2, true)
    end
  end

  describe "#evolve" do
    context "when the cell is alive" do
      let(:cell) { Cell.new 0, 0, true }

      [2, 3].each do |num_neighbors|
        it "survives with exactly #{num_neighbors} live neighbors" do
          expect(cell.evolve(num_neighbors)).to be_alive
        end
      end

      [0, 1, 4, 5, 6, 7, 8].each do |num_neighbors|
        it "dies with exactly #{num_neighbors} live neighbors" do
          expect(cell.evolve(num_neighbors)).to_not be_alive
        end
      end
    end
    context "when the cell is dead" do
      let(:cell) { Cell.new 0, 0, false }

      it "comes to life with exactly 3 neighbors" do
        expect(cell.evolve(3)).to be_alive
      end

      [0, 1, 2, 4, 5, 6, 7, 8].each do |num_neighbors|
        it "stays dead with exactly #{num_neighbors} live neighbors" do
          expect(cell.evolve(num_neighbors)).to_not be_alive
        end
      end
    end
  end
end
