class Array
  def remove_dupes
    results = self.dup
    counter_hash = Hash.new(0)
    self.each_with_index do |el, i|
      counter_hash[el] += 1
      if counter_hash[el] > 1
        results[i] = nil
      end
    end
    results.delete(nil)
    results
  end

  def two_sum
    result = []

    (0...self.length).each do |i1|
      (0...self.length).each do |i2|
        next if i1 >= i2
        result << [i1, i2] if self[i1] + self[i2] == 0
      end
    end

    result
  end

  def my_transpose
    result = Array.new(self.length) { Array.new(self.length) }

    self.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        result[row_idx][col_idx] = self[col_idx][row_idx]
      end
    end

    result
  end

  def stock_picker
    result = []
    max_difference = 0
    self.each_with_index do |i, idx1|
      self.each_with_index do |j, idx2|
        next if idx1 >= idx2
        difference = j - i
        if difference > max_difference
          max_difference = difference
          result = [idx1, idx2]
        end
      end
    end
    result
  end
end


class Towers
  def initialize(tower_arr)
    @tower_arr = tower_arr
  end

  def move(start_tower, end_tower)
    if valid_move?(start_tower, end_tower)
      @tower_arr[end_tower].push(@tower_arr[start_tower].pop)
    end

    @tower_arr
  end

  def valid_move?(start_tower, end_tower)
    if @tower_arr[end_tower][-1].nil?
      return true
    end

    if @tower_arr[start_tower][-1] > @tower_arr[end_tower][-1]
      false
    else
      true
    end
  end

  def won?
    @tower_arr[0].empty? && (@tower_arr[1].empty? || @tower_arr[2].empty?)
  end
end
