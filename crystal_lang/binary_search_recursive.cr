def binary_search_recursive(list, target_item, low_index, high_index)
  return nil if low_index > high_index

  mid_index = (low_index + high_index) / 2
  guess = list[mid_index]

  if guess == target_item
    return mid_index
  end


  if guess > target_item
    binary_search_recursive(list, target_item, low_index, mid_index - 1)
  else
    binary_search_recursive(list, target_item, mid_index + 1, high_index)
  end
end

my_list = [1, 3, 5, 7, 9]
puts binary_search_recursive(my_list, 3, 0, my_list.size - 1) # => 1
puts "nil" if  binary_search_recursive(my_list, -1, 0, my_list.size - 1).nil? # => nil
