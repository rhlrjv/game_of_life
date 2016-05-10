require_relative '../cell.rb'

describe Cell do
  describe "#alive?" do
    context "when the cell is alive" do
      subject { Cell.new(true) }
      specify { is_expected.to be_alive }
    end

    context "when the cell is not alive" do
      subject { Cell.new(false) }
      specify { is_expected.to_not be_alive }
    end
  end
end
