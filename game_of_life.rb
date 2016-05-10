#!/usr/bin/env ruby

require 'pry'

class GameOfLife
  def initialize(file_path)
    @board = GridParser.parse(file_path)
  end
end

class GridParser
  def self.parse(filename)
  end
end

puts "hello"
