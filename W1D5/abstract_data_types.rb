class Stack
  def initialize
    @elements = []
    @top = @elements.last
    @bottom = @elements.first
  end

  def add(el)
    # adds an element to the stack
    @elements << el
  end

  def remove
    # removes one element from the stack
    @elements.pop
  end

  def show
    # return a copy of the stack
    @elements
  end
end

class Queue
  def initialize
    @line = []
    @first = @line.first
    @last = @line.last
  end

  def enqueue(el)
    @line.push(el)

  end

  def dequeue
    @line.shift
  end

  def show
    @line
  end
end

class Map

  attr_reader :map

  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      @map.each do |array|
        if array[0] == key
          array[1] = value
        end
      end
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each do |array|
      return array[1] if array[0] == key
    end
    nil
  end

  def remove(key)
    @map.each_with_index do |array, idx|
      if array[0] == key
        @map.delete(array)
        break
      end
    end
  end


# Solution:
# def remove(key)
#   @map.reject! {|pair| pair[0] == key}
#   nil
# end

  def show
    @map
  end
end
