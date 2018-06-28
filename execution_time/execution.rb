
def my_min(arr)
  min = arr.first
  arr.each_with_index do |el1, idx1|
    (idx1+1...arr.length).each do |idx2|
      min = el1 if el1 < arr[idx2] && el1 < min
    end
  end
  min
end

def my_min2(arr)
  min = arr.first
  arr.each { |el| min = el if el < min }
  min
end

def largest_contiguous_subsum(arr)
  max = arr.first
  arr.each_index do |idx1|
    (idx1+1..arr.length).each do |idx2|
      sub_arr = arr[idx1...idx2]
      sum = sub_arr.reduce(:+)
      max = sum if max < sum 
    end

  end
  max
end

def optimized_largest_subsum(arr)
  max = arr.first
  sum = arr.first 
  arr.shift
  arr.each do |el|
    sum += el
    if el > max && el > sum 
      max = el 
      sum = el 
    elsif sum > max
      max = sum
    end 
  end 
  max
end 

 list = [-5, -1, -3]
 p optimized_largest_subsum(list)