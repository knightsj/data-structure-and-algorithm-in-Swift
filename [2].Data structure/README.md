#  Data Structure



Swift implementation of linked list, stack and queue.



## Linked  list



```swift
public class LinkedListNode<T> {
    
    
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    public var isEmpty: Bool {
        
        return head == nil
    }
    
    public var count: Int {
        
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    private var head: Node?
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        
        guard var node = head else {
            return nil
        }
        
        //until node.next is nil
        while let next = node.next {
            node = next
        }
        return node
    }
    
    //get node of index
    public func node(atIndex index: Int) -> Node? {
        
        if index == 0 {
            //head node
            return head!
            
        } else {
            
            var node = head!.next
            
            guard index < count else {
                return nil;
            }
            
            for _ in 1..<index {
                // go on finding by .next
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            return node!
        }
    }
    
    //insert node to last index
    public func appendToTail(value: T) {
        
        let newNode = Node(value: value)
        
        if let lastNode = last {
            
            //update last node: newNode becomes new last node;
            //the previous last node becomes the second-last node
            newNode.previous = lastNode
            lastNode.next = newNode
            
        } else {
            
            //blank linked list
            head = newNode
        }
    }
    
    //insert node to index 0
    public func insertToHead(value: T) {
        
        let newHead = Node(value: value)
        
        if head == nil {
            
            //blank linked list
            head = newHead
            
        }else {
            
            newHead.next = head
            head?.previous = newHead
            head = newHead
            
        }
    }
    
    //insert node in specific index
    public func insert(_ node: Node, atIndex index: Int) {
        
        if index < 0 {
            
            print("invalid input index")
            return
        }
        
        let newNode = node
        
        if count == 0 {
            
            head = newNode
            
        }else {
            
            if index == 0 {
                
                newNode.next = head
                head?.previous = newNode
                head = newNode
                
            } else {
                
                if index > count {
                    
                    print("out of range")
                    return
                    
                }
                
                let prev = self.node(atIndex: index-1)
                let next = prev?.next
                
                newNode.previous = prev
                newNode.next = prev?.next
                prev?.next = newNode
                next?.previous = newNode
            }
            
        }
    }
    
    //removing all nodes
    public func removeAll() {
        head = nil
    }
    
    //remove the last node
    public func removeLast() -> T? {
        
        guard !isEmpty else {
            return nil
        }
        
        return remove(node: last!)
    }
    
    //remove a node by it's refrence
    public func remove(node: Node) -> T? {
        
        guard head != nil else {
            print("linked list is empty")
            return nil
        }
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    
    //remove a node by it's index
    public func removeAt(_ index: Int) -> T? {
        
        guard head != nil else {
            print("linked list is empty")
            return nil
        }
        
        let node = self.node(atIndex: index)
        guard node != nil else {
            return nil
        }
        return remove(node: node!)
    }
    
    
    public func printAllNodes(){
        
        guard head != nil else {
            print("linked list is empty")
            return
        }
        
        var node = head
        
        print("\nstart printing all nodes:")
        
        for index in 0..<count {
            
            if node == nil {
                break
            }
            
            print("[\(index)]\(node!.value)")
            node = node!.next
            
        }
    }
}
```



## Stack



```swift
public struct Stack<T> {
    
    //array
    fileprivate var stackArray = [T]()
    
    //count
    public var count: Int {
        return stackArray.count
    }
    
    //is empty ?
    public var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    //top element
    public var top: T? {
        
        if isEmpty{
            return nil
        }else {
            return stackArray.last
        }
        
    }
    
    //push operation
    public mutating func push(_ element: T) {
        stackArray.append(element)
    }
    
    
    //pop operation
    public mutating func pop() -> T? {
        
        if isEmpty{
            print("stack is empty")
            return nil
        }else {
            return stackArray.removeLast()
        }
    }
    
    //print all
    public mutating func printAllElements() {
        
        guard count > 0 else {
            print("stack is empty")
            return
        }
        
        print("\nprint all stack elemets:")
        for (index, value) in stackArray.enumerated() {
            print("[\(index)]\(value)")
        }
    }
}
```



## Queue

```swift
public struct Queue<T> {
    
    //array
    fileprivate var queueArray = [T]()
    
    
    //count
    public var count: Int {
        return queueArray.count
    }
    
    
    //is empty?
    public var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    
    //front element
    public var front: T? {
        
        if isEmpty {
            print("queue is empty")
            return nil
        } else {
            return queueArray.first
        }
    }
    
    
    //add element
    public mutating func enqueue(_ element: T) {
        queueArray.append(element)
    }
    
    
    //remove element
    public mutating func dequeue() -> T? {
        if isEmpty {
            print("queue is empty")
            return nil
        } else {
            return queueArray.removeFirst()
        }
    }
    
    //print all
    public mutating func printAllElements() {
        
        guard count > 0 else {
            print("queue is empty")
            return
        }
        
        print("\nprint all queue elemets:")
        for (index, value) in queueArray.enumerated() {
            print("[\(index)]\(value)")
        }
    }
    
}
```

