require_relative 'grid.rb'

class GridParser
  def self.parse(filename)
    lines_without_dimensions = File.read(filename).split("\n").drop(1)
    parsed_file = lines_without_dimensions.reduce([]) do |arr, line|
      arr << line.each_char.map { |c| c == '*' }
    end
    Grid.new(parsed_file)
  end
end
