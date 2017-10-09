class Stack
  def initialize
    @ivar = []
    # create ivar to store stack here!
  end

  def add(el)
    @ivar.push(el)
    # adds an element to the stack
  end

  def remove
    @ivar.pop
    # removes one element from the stack
  end

  def show
    @ivar
    # return a copy of the stack
  end
end

class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.push(el)
  end

  def dequeue
    @ivar.shift
  end

  def show
    @ivar
  end
end

class Map
  def initialize
    @ivar = []
  end

  def assign(key, value)
    pair_index = @ivar.index {|pair| pair[0] == key}
    pair_index ? @ivar[pair_index][1] = value : @ivar.push([key, value])
   [key, value]
    # @ivar.push([key, value]) unless self.key?(key)
  end


  def lookup(key)
    @ivar.each_with_index { |pair, i| return i if pair[0] == key }
  end

  def remove(key)
    @ivar.each { |pair| return @ivar.delete(pair) if pair[0] == key }
  end

  def show
    @ivar
  end

  # protected
  # def key?(key)
  #   @ivar.any? { |pair| pair[0] == key }
  # end
end
