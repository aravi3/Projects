require_relative 'data_structures'

def naive_windowed_max_range(arr, window)
  current_max_range = nil
  arr.each_index do |i|
    max = arr[i...i + window].max
    min = arr[i...i + window].min
    current_max_range ||= max - min
    current_max_range = max - min if (max - min) > current_max_range
  end
  current_max_range
end

# def windowed_max_range(arr, window)
#   current_max_range = -1.0/0.0
#   i = 0
#   while (i + window) <= arr.length
#     queue = MinMaxStackQueue.new
#     arr[i...i + window].each do |num|
#       queue.enqueue(num)
#     end
#     max = queue.max
#     min = queue.min
#     current_max_range = max - min if (max - min) > current_max_range
#     i += 1
#   end
#   current_max_range
# end
#
def windowed_max_range(arr, window)
  queue = MinMaxStackQueue.new
  (0...window).each do |i|
    queue.enqueue(arr[i])
  end
  idx = window
  max_range = queue.max - queue.min
  while idx < arr.size
    queue.enqueue(arr[idx])
    queue.dequeue
    max_range = queue.max - queue.min if (queue.max - queue.min) > max_range
    idx += 1
  end
  max_range
end

arr = (1..1000000).to_a
n = Time.now
windowed_max_range(arr, 5)
m = Time.now
p m - n

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
