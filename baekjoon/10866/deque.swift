//덱: https://www.acmicpc.net/problem/10866 덱을 구현함

import Foundation

enum DequeInstruction: String {
    case pushFront = "push_front"
    case pushBack = "push_back"
    case popFront = "pop_front"
    case popBack = "pop_back"
    case size = "size"
    case empty = "empty"
    case front = "front"
    case back = "back"
}

struct Deque<T> {
    private var inQueue: [T] = []
    private var outQueue: [T] = []
    
    func isEmpty() -> Bool {
        return inQueue.isEmpty && outQueue.isEmpty
    }
    
    func size() -> Int {
        return inQueue.count + outQueue.count
    }
    
    mutating func pushFront(element: T) {
        outQueue.append(element)
    }
    
    mutating func pushBack(element: T) {
        inQueue.append(element)
    }
    
    mutating func popFront() -> T? {
        
        guard !(isEmpty()) else {
            return nil
        }
        
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
    
        return outQueue.removeLast()
    }
    
    mutating func popBack() -> T? {
        
        guard !(isEmpty()) else {
            return nil
        }
        
        return inQueue.isEmpty ? outQueue.removeFirst() : inQueue.removeLast()
    }
    
    func front() -> T? {
        return outQueue.last ?? inQueue.first
    }
    
    func back() -> T? {
        return inQueue.last ?? outQueue.first
    }
   
    mutating func execute(instruction: DequeInstruction, element: T?) {
        switch instruction {
        case .pushFront:
            if let element = element {
                pushFront(element: element)
            }
        case .pushBack:
            if let element = element {
                pushBack(element: element)
            }
        case .popFront:
            if let value = popFront() {
                print(value)
            } else {
                print(-1)
            }
        case .popBack:
            if let value = popBack() {
                print(value)
            } else {
                print(-1)
            }
        case .size:
            print(size())
        case .empty:
            isEmpty() ? print(1) : print(0)
        case .front:
            if let value = front() {
                print(value)
            } else {
                print(-1)
            }
        case .back:
            if let value = back() {
                print(value)
            } else {
                print(-1)
            }
        }
    }
}

let N = Int(readLine()!)!

var deque = Deque<Int>()
for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
    let instruction = DequeInstruction(rawValue: String(input[0]))!
    var element: Int? = nil
    if input.count == 2 { element = Int(input[1]) }
    
    deque.execute(instruction: instruction, element: element)
}



