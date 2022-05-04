//요세푸스 문제 0: https://www.acmicpc.net/problem/11866 큐를 활용하여 해결하였으나, pop() 연산이 O(n)이기에 비효율적임

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func size() -> Int {
        return queue.count
    }
    
    mutating func push(element: T) {
        queue.append(element)
    }
    
    mutating func pop(index: Int) -> T? {
        
        guard !(isEmpty()) else {
            return nil
        }
        
        return queue.remove(at: index % size())
    }
    
    mutating func pop() -> T? {
        
        guard !(isEmpty()) else {
            return nil
        }
        
        return queue.removeFirst()
    }
    
    func front() -> T? {
        return queue.first
    }
    
    func back() -> T? {
        return queue.last
    }
    
    mutating func execute(instruction: QueueInstruction, element: T?) {
        
        switch instruction {
        case .push:
            if let element = element {
                push(element: element)
            }
        case .pop:
            if let result = pop() {
                print(result)
            } else {
                print(-1)
            }
        case .size:
            print(size())
        case .empty:
            isEmpty() ? print("1") : print("0")
        case .front:
            if let result = front() {
                print(result)
            } else {
                print(-1)
            }
        case .back:
            if let result = back() {
                print(result)
            } else {
                print(-1)
            }
        }
    }
}

enum QueueInstruction: String {
    case push
    case pop
    case size
    case empty
    case front
    case back
}

var queue = Queue<Int>()
let input = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }
let (N, K) = (input[0], input[1])
for element in 1...N {
    queue.push(element: element)
}

var index = 0
var result: [String] = []
while !queue.isEmpty() {
    index = (index + (K - 1)) % queue.size()
    if let element = queue.pop(index: index) {
        result.append("\(element)")
    }
}

print("<\(result.joined(separator: ", "))>")


