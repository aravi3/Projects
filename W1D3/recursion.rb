require "byebug"

def range(start, finish)
  return [] if finish < start
  [start] + range(start + 1, finish)
end

def sum_of_array(arr)
  return 0 if arr.empty?
  arr[0] + sum_of_array(arr[1..-1])
end

def exp1(base, power)
  return 1 if power == 0
  base * exp1(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  temp = exp2(base, (power) / 2)
  return temp * temp if power.even?
  (base) * (temp * temp) if power.odd?
end

class Array

  def deep_dup
    result = []

    return result if self.length == 0

    self.each_index do |i|
      if self[i].is_a?(Array)
        result << self[i].deep_dup
      else
        result << self[i]
      end
    end
    return result
  end

end

def fib(num)
  return 0 if num == 1
  return 1 if num == 2

  fib(num-1) + fib(num-2)
end

def fib2(num)
  arr = [0,1]
  i = 1
  while i < num
    arr << arr[i] + arr[i -1]
    i += 1
  end
  arr[num-1]
end

def subsets(arr)
  return [[]] if arr.empty?
  result = []
  subsets(arr[0..-2]).each do |el|
    result << el + [arr[-1]]
  end
  return subsets(arr[0..-2]) + result
end

def perm(arr)

end
