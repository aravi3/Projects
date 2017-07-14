def my_min(list)
  list.each_index do |i|
    smallest = true
    list.each_index do |j|
      next if i == j
      smallest = false if list[j] < list[i]
    end

    return list[i] if smallest
  end
end

def my_min2(list)
  min = Float::INFINITY

  list.each do |num|
    if num < min
      min = num
    end
  end

  min
end

def largest_contiguous_subsum(list)
  largest = -1.0/0.0

  list.each_index do |i|
    list.each_index do |j|
      next unless i <= j
      if list[i..j].reduce(:+) > largest
        largest = list[i..j].reduce(:+)
      end
    end
  end

  largest
end

def largest_contiguous_subsum2(list)
  return list.max if list.all? { |num| num < 0 }

  largest = -1.0 / 0.0
  current = 0

  list.each do |num|
    current = 0 if current < 0
    current += num
    largest = current if largest < current
  end

  largest
end


list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) == 8

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) == -1
