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

    @n = @board.size
    @sqrt_n = Math.sqrt(@n).to_i
    @arr = @board.map do |row|
      (0..@n).map do |i|
        ( (1..@n) === row[i] ) ? [row[i]] : (1..@n).to_a
      end
    end

    @row_fix = Array.new(@n, [])
    @col_fix = Array.new(@n, [])
    @box_fix = Array.new(@n, [])
    @n.times { |row| @n.times { |col| update_fix(row, col) } }
  end

  def load_data(source_str)
    @board = Array.new
    source_str.each_line do |line|
      next unless line =~ /\d|_/
      @board << line.scan(/[\d_]/).map { |e| e.to_i }
    end
  end

  def to_a
    @arr.collect { |row| row.collect { |x|
      (x.size == 1) ? x[0] : nil
    } }
  end

  def to_s
    fw = @n.to_s.size
    to_a.collect { |row| row.collect { |x|
      (x ? x.to_s : "_").rjust(fw)
    }.join " " }.join "\n"
  end

  def finished?
    @arr.each { |row| row.each { |e| return false if e.size > 1 } }
    true
  end

  def rc_to_box(r, c)
    (r - (r % @sqrt_n)) + (c / @sqrt_n)
  end

  def update_fix(row, col)
    if @arr[row][col].size == 1
      @row_fix[row] << @arr[row][col][0]
      @col_fix[col] << @arr[row][col][0]
      @box_fix[rc_to_box(row, col)] << @arr[row][col][0]
    end
  end

  def reduce
    success = false
    @n.times do |row|
      @n.times do |col|
        if (sz = @arr[row][col].size) > 1
          @arr[row][col] = @arr[row][col] - (@row_fix[row] | @col_fix[col] | @box_fix[rc_to_box(row, col)] )
          raies "Impossible to solve" if @arr[row][col].empty?
          if @arr[row][col].size < sz
            success = true
            update_fix(row, col)
          end
        end
      end
    end
    success
  end

  def deduce
    success = false
    [:col_each, :row_each, :box_each].each do |method|
      @n.times do |i|


    end

  end

end

Sodoku.new(data_source)
