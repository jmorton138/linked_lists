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
    
 
        # #new node points to nil. Maybe reduntant because default is nil.
        # new_node.next_node = nil
        # #previous last node points to new node
        # prev.next_node = new_node
    end
    def append(value)
        new_node = Node.new(value)
        #traverse list until nil
        node = self.head
        puts node.value 
        while node.next_node != nil
            node = node.next_node
        end
        #point previous last node to new node with new node point to nil
        node.next_node = new_node

    end


    def traverse
        #traverse list until nil
        node = self.head
        puts node.value 
        while node.next_node != nil
            node = node.next_node
            puts node.value
        end
        p node.next_node
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node = nil)
        @value =  value
        @next_node = next_node
    end

end



# list = LinkedList.new()
# list.prepend("new")
# list.prepend("darren")
# list.prepend("steve")
# list.traverse
# puts "------"
# list.append("joe")
# list.traverse

