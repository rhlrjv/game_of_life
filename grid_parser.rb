require_relative 'grid.rb'

class GridParser
  def self.parse(input_string)
    lines_without_dimensions = input_string.split("\n").drop(1)
    parsed_file = lines_without_dimensions.reduce([]) do |arr, line|
      arr << line.each_char.map { |c| c == '*' }
    end
    Grid.from_bool_array(parsed_file)
  end
end
