data_source = '+-------+-------+-------+
               | _ 6 _ | 1 _ 4 | _ 5 _ |
               | _ _ 8 | 3 _ 5 | 6 _ _ |
               | 2 _ _ | _ _ _ | _ _ 1 |
               +-------+-------+-------+
               | 8 _ _ | 4 _ 7 | _ _ 6 |
               | _ _ 6 | _ _ _ | 3 _ _ |
               | 7 _ _ | 9 _ 1 | _ _ 4 |
               +-------+-------+-------+
               | 5 _ _ | _ _ _ | _ _ 2 |
               | _ _ 7 | 2 _ 6 | 9 _ _ |
               | _ 4 _ | 5 _ 8 | _ 7 _ |
               +-------+-------+-------+'

class Sodoku
  attr_accessor :board

  def initialize(source_str)
    load_data(source_str)
    solve
  end

  def load_data(source_str)
    @board = Array.new
    source_str.each_line do |line|
      next unless line =~ /\d|_/
      @board << line.scan(/[\d_]/).map { |e| e.to_i }
    end
  end

  def solve
    p @board
  end
end

Sodoku.new(data_source)
