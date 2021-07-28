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

    def pop
        node = self.head
        while node.next_node.next_node != nil
            node = node.next_node
        end
        node.next_node = nil
    end

    def contains?(value)
        node = self.head
        while node != nil
            if node.value == value
                return true
            end
            node = node.next_node
        end
        false
    end

    def find(value)
        node = self.head
        counter = 1
        while node != nil
            if node.value == value
                return counter
            end
            node = node.next_node
            counter += 1
        end
        nil
    end

    def to_s
        string = ""
        node = self.head
        while node != nil
            string << "( #{node.value} ) --> "
            node = node.next_node
        end
        string << " nil"

    end

    def insert_at(value, index)
        new_node = Node.new(value)
        counter = 0
        node = self.head
        if index == 0
            prepend(value)
            return
        end
        while node != nil
            prev_node = node      
            counter +=1
            node = node.next_node
            if index == counter
                new_node.next_node = node
                prev_node.next_node = new_node
                return
            end
        end
    end

    def remove_at(index)
        counter = 0
        node = self.head
        while node != nil
            if index == 0
                self.head = node.next_node
                return
            end  
            prev_node = node    
            counter +=1
            node = node.next_node
            if index == counter
                #point prev node to 
                prev_node.next_node = node.next_node
                node.next_node = nil
                return
            end
        end
        return "Index out of bounds"
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

list.insert_at("peanut", 3)
list.remove_at(0)
p list.to_s


