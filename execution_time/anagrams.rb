#(O(n!) time)
#O(n!) space 
def first_anagram?(first, second)
  anagrams = first.split("").permutation.to_a
  anagrams = anagrams.map {|el| el.join("")}
  anagrams.include?(second)
end 


#O(n^2) time
#O(n) space 
def second_anagram?(first, second)
  first = first.split("")
  second = second.split("")
  first.each_with_index do |char, idx|
    if second.include?(char)
      delete_idx = second.index(char)
      second.delete_at(delete_idx)
      first.delete_at(idx)
    end
  end
  
  first == second
end

#O(n^2) quicksort, O(nlogn) if mergesort
#O(2n) space
def third_anagram?(first, second)
  first.chars.sort == second.chars.sort
end

#O(n) time
#O(1) space
def fourth_anagram?(first, second)
  hash = Hash.new(0)
  first.chars.each do |char|
    hash[char] += 1
  end
  second.chars.each do |char|
    hash[char] -= 1
  end
  hash.values.reduce(:+) == 0
end

first_anagram?("elvis", "lives") 
second_anagram?("elvis", "lives") 
third_anagram?("elvis", "lives")
fourth_anagram?("elvis", "lives")