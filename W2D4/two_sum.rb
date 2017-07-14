def bad_two_sum?(arr, target_sum)
  arr.each_index do |i|
    arr.each_index do |j|
      next unless i < j
      return true if arr[i] + arr[j] == target_sum
    end
  end

  false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort

  arr.each do |num|
    return true if arr.bsearch do |x|
      x != num && (target_sum - x == num)
    end
  end

  false
end

def two_sum?(arr, target_sum)
  hsh = Hash.new(target_sum)
  return true if arr.select { |a| target_sum - a == a }.size > 1
  arr.each { |num| hsh[num] -= num unless target_sum - num == num }
  arr.each { |num| return true if hsh.value? num }
  false
end








arr = [0, 1, 5,5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
