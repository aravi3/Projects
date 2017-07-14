class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @max = -1.0 / 0.0
    @min = 1.0 / 0.0
    @vals = Hash.new(0)
  end

  def push(el)
    @max = el if el > @max
    @min = el if el < @min
    @vals[el] += 1
    @store.push(el)
  end

  def max
    return @max if @vals[@max] > 0
    @max = @store.max 
  end

  def min
    return @min if @vals[@min] > 0
    @min = @store.min
  end

  def pop
    n = @store.pop
    @vals[n] -= 1
    # @max = @store.max
    # @min = @store.min
    n
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @store = MyStack.new
    @store2 = MyStack.new
    # @max1 = -1.0 / 0.0
    # @min1 = 1.0 / 0.0
    # @max2 = -1.0 / 0.0
    # @min2 = 1.0 / 0.0
  end

  def enqueue(el)
    # @max1 = el if el > @max1
    # @min1 = el if el < @min1
    @store.push(el)
  end

  def dequeue
    # @max2 = -1.0 / 0.0
    # @min2 = 1.0 / 0.0
    if @store2.empty?
      @store.size.times do
        n = @store.pop
        # @max2 = n if n > @max2
        # @min2 = n if n < @min2
        @store2.push(n)
      end
    end
    @store2.pop
  end

  def max
    # if @max2 > @max1
    #   @max2
    # else
    #   @max1
    # end
    if @store2.max
      @store2.max > @store.max ? @store2.max : @store.max
    else
      @store.max
    end
  end

  def min
    # if @min2 < @min1
    #   @min2
    # else
    #   @min1
    # end
    if @store2.min
      @store2.min > @store.min ? @store2.min : @store.min
    else
      @store.min
    end
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue < StackQueue
end
