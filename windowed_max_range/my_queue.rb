class MyQueue
  def initialize
    @queue = []
  end
  
  def enqueue(el)
    @queue.push(el)
  end
  
  def dequeue
    @queue.shift
  end
  
  def peek
    @queue.first
  end
  
  def size
    @queue.length
  end
  
  def empty?
    @queue.empty?
  end
  
end