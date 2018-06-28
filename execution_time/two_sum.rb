#O(n^2)
def bad_two_sum?(arr, target_sum)

  arr.each_index do |idx|
    (idx+1...arr.length).each do |i|
      return true if (arr[idx] + arr[i] == target_sum) 
    end 
  end 
  false
  
end 

def merge_sort(arr)
  return arr if arr.length == 1 
  mid = arr.length/2
  left = merge_sort(arr.take(mid))
  right = merge_sort(arr.drop(mid))
  merge(left, right)
end 
def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first > right.first 
      result << right.shift
    else 
      result << left.shift
    end
  end 
  result + left + right
end 

def okay_two_sum?(arr, target_sum)
  sorted = merge_sort(arr)
  first = 0
  last = sorted.length - 1
  
  until first >= last
    sum = sorted[first] + sorted[last]
    case sum <=> target_sum
    when -1 
      first += 1
    when 0
      return true
    when 1
      last -= 1
    end 
  end
  false 
end 

def two_sum?(arr, target_sum)
  hash = Hash.new
  arr.each_with_index do |el, idx|
    hash[el] = idx
  end 
  arr.each_with_index do |el, idx|
    difference = target_sum - el
    return true if hash[difference] && hash[difference] != idx
  end 
  false
end 
arr = [0, 1, 5, 7]
p two_sum?(arr, 11)
