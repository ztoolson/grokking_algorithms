def person_is_mango_seller(person_name)
  person_name[-1] == 'm'
end

def breadth_first_search(graph, start_name)
  search_queue = [] of String
  searched = [] of String

  search_queue.concat(graph[start_name])

  while search_queue.size >= 0
    person_name = search_queue.delete_at(0)

    if !searched.includes?(person_name)
      if person_is_mango_seller(person_name)
        puts "#{person_name} is a mango seller!"
        return true
      else
        search_queue.concat(graph[person_name])
      end
    end
  end

  return false
end

# Who in your network you are connected to. Use BFS to find a connection that is a mango seller
graph = Hash(String, Array(String)).new
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = [] of String
graph["peggy"] = [] of String
graph["thom"] = [] of String
graph["jonny"] = [] of String

breadth_first_search(graph, "you")
