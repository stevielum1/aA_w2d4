require_relative 'min_max_stack_queue'
require "byebug"
def windowed_max_range(arr, window_size)
  current_max_range = nil
  arr.each_index do |start_idx|
    end_idx = start_idx + window_size
    return current_max_range if end_idx > arr.length
    sub_arr = arr[start_idx...end_idx]
    max = sub_arr.max - sub_arr.min
    current_max_range = max if current_max_range.nil? || current_max_range < max
  end
  current_max_range
end

def optimized_windowed_max_range(arr, window_size)
  current_max_range = nil
  queue = MinMaxStackQueue.new
  arr.each_with_index do |el, start_idx|
    queue.enqueue(el)
    if queue.size == window_size
      
      max = queue.max - queue.min
      queue.dequeue
      current_max_range = max if current_max_range.nil? || current_max_range < max
    end 
  end
  current_max_range
end

p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 2)# 4, 8
p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 3)# 0, 2, 5
p optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 4)# 2, 5, 4, 8
p optimized_windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8