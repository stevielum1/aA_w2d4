require_relative "my_stack"
class MinMaxStack
  
  def initialize
    @stack = MyStack.new
  end 
  
  def push(el)
    
    if empty?
      hash = {num: el, max: el, min: el}
      @stack.push(hash)
    else
      prev_el = peek
      max = prev_el[:max]
      min = prev_el[:min]
      max = el if el > max 
      min = el if el < min
      hash = {num: el, max: max, min: min}
      @stack.push(hash)
    end 
  end 
  
  def size 
    @stack.size
  end 
  
  def empty?
    @stack.empty?
  end 
  
  def pop 
    elem = @stack.pop 
    elem[:num]
  end 
  
  def max 
    peek[:max]
  end 
  
  def min 
    peek[:min]
  end 
  
  def peek
    @stack.peek
  end 
end 

