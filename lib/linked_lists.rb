class LinkedList
    attr_accessor :head

    def initialize(head = Node.new)
        @head = head
    end

    def prepend(value)
        new_node = Node.new(value)
        if self.head.value == nil
            #if list is empty set head to new node
            self.head = new_node
        else
            #if list is not empty point new node to old head node
            new_node.next_node = self.head
            #set head to new node
            self.head = new_node
        end
    end

    def append(value)
        new_node = Node.new(value)
        #traverse list until nil
        node = self.head
        while node.next_node != nil
            node = node.next_node
        end
        #point previous last node to new node with new node point to nil
        node.next_node = new_node

    end

    def tail
        node = self.head
        while node.next_node != nil
            node = node.next_node
        end
        node
    end

    def at(index)
        counter = 0
        node = self.head
        while node != nil
            if index == counter
                return node.value
            end
            node = node.next_node
            counter +=1
        end
    end


    def traverse
        #traverse list until nil
        node = self.head
        puts node.value 
        while node.next_node != nil
            node = node.next_node
            puts node.value
        end

    end

    def size
        #traverse list until nil with counter each time
        node = self.head
        puts node.value 
        counter = 1
        while node.next_node != nil
            node = node.next_node
            counter += 1
        end
        p counter
    end

 
    #head method prints whole linked list because each object is nested in the next_node instance

end

class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node = nil)
        @value =  value
        @next_node = next_node
    end

end



list = LinkedList.new()
list.prepend("new")
list.prepend("darren")
list.prepend("steve")
puts "------"
list.append("joe")
list.traverse
p list.at(4)

