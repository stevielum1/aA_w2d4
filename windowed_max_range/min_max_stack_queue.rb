require_relative "min_max_stack"

class MinMaxStackQueue
  def initialize
    @pop_stack = MinMaxStack.new
    @push_stack = MinMaxStack.new
  end
  
  def size
    @pop_stack.size + @push_stack.size
  end
  
  def empty?
    @pop_stack.empty? && @push_stack.empty?
  end
  
  def enqueue(el)
    @push_stack.push(el)
  end
  
  def dequeue
    populate_pop_stack if @pop_stack.empty?
    @pop_stack.pop
  end
  
  def min
    populate_pop_stack if @pop_stack.empty?
    @pop_stack.min
  end
  
  def max
    populate_pop_stack if @pop_stack.empty?
    @pop_stack.max
    
  end
  
  private
  
  def populate_pop_stack
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
  end
  
end



