# Returns the index of the smallest item in the array. O(n)
def find_smallest(array : Array(Int32))
  smallest_index = 0
  smallest = array[smallest_index]

  array.each_with_index do |element, index|
    if element < smallest
      smallest = element
      smallest_index = index
    end
  end

  smallest_index
end

# This is very inefficent. Not only is it O(n**2), but we are using an extra array instead of
# updatating the original array in place.
def selection_sort(array)
  new_array = Array(Int32).new(array.size)

  1.upto(array.size).each do |i|
    smallest_index = find_smallest(array)
    new_array << array.delete_at(smallest_index)
  end

  new_array
end

puts selection_sort([5, 3, 6, 2, 10])
puts selection_sort([10, 8, 6, 4, 2, 0])
