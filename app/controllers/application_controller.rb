class ApplicationController < ActionController::Base
end

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    return print "nil\n" if @data.nil?
    print "#{@data.value}\n"
    @data = @data.next_node
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(any)
  # instatiate stack
  stack = Stack.new
  
  #iterate through linked list
  while any
    #push current node onto stack node 1 at bottom, node 3 (or n)  at the top
    stack.push(any.value)
    #put list together
    any = any.next_node
  end
  # return stacked data to caller 
  return stack.data
end

# create the linked list
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)


#print linked list as is
print_values(node3)

#separator
puts "---------"

#reverse linked list via a stack and print it
revlist = reverse_list(node3)
print_values(revlist)
