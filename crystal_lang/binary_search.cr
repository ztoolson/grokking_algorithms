def binary_search(list, target_item)
  # keep track of which part of the list to search in
  low_index = 0
  high_index = list.size - 1

  while low_index <= high_index # when you haven't narrowed it down to one element
    mid_index = (low_index + high_index) / 2
    guess = list[mid_index]

    if guess == target_item
      return mid_index
    end

    if guess > target_item 
      high_index = mid_index - 1
    else
      low_index = mid_index + 1
    end
  end
  
  return nil # item doesn't exist in list
end

my_list = [1, 3, 5, 7, 9]

puts binary_search(my_list, 3) # => 1
puts "nil" if  binary_search(my_list, -1).nil? # => nil
