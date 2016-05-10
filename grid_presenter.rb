class GridPresenter
  def self.serialize(grid)
    arr = grid.to_a
    num_rows = arr.size
    num_cols = arr[0].size

    arr.inject("#{num_rows} #{num_cols}\n") do |output, row|
      output << row.map { |c| c.alive? ? '*' : '.' }.join
      output << "\n"
    end
  end
end
