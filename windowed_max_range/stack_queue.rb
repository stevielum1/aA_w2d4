require_relative 'my_stack'

class StackQueue
  def initialize
    @pop_stack = MyStack.new
    @push_stack = MyStack.new
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
  
  
  private
  
  def populate_pop_stack
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
  end
  
end