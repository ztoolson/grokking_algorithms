def quicksort(array)
  return array if array.size < 2 # nothing to sort for 0 or 1 size arrays

  pivot = array.delete_at(get_pivot_index(array))

  less = array.select { |i| i <= pivot }
  greater = array.select { |i| i > pivot }

  quicksort(less) + [pivot] + quicksort(greater)
end

# super ugly way to get the middle number index for possible pivots.
def get_pivot_index(array)
  return 0 if array.size <= 2

  mid_index = (array.size - 1) / 2

  first_element = array.first
  mid_element = array[mid_index]
  last_element = array.last

  element_to_index = {
    first_element => 0,
    mid_element => mid_index,
    last_element => array.size - 1
  }

  possible_pivots = [first_element, mid_element, last_element]
  min_index = possible_pivots.each_with_index.min[1]
  possible_pivots.delete_at(min_index)

  max_index = possible_pivots.each_with_index.max[1]
  possible_pivots.delete_at(max_index)

  element_to_index[possible_pivots.first]
end

puts quicksort([10, 5, 2, 3])
puts quicksort([1, 2, 3, 4, 5])
puts quicksort([5, 4, 3, 2, 1])
puts quicksort([2, 3, 1, 5, 4])
