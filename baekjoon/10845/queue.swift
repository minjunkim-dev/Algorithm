//큐: https://www.acmicpc.net/problem/10845 효율성을 위해 DoubleStack 형태의 큐를 구현함

import Foundation

struct Queue<T> {
    private var inQueue: [T] = []
    private var outQueue: [T] = []
    
    func isEmpty() -> Bool {
        return inQueue.isEmpty && outQueue.isEmpty
    }
    
    func size() -> Int {
        return inQueue.count + outQueue.count
    }
    
    mutating func push(element: T) {
        inQueue.append(element)
    }
    
    mutating func pop() -> T? {
        
        guard !(isEmpty()) else {
            return nil
        }
        
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
    
        return outQueue.removeLast()
    }
    
    func front() -> T? {
        return outQueue.last ?? inQueue.first
    }
    
    func back() -> T? {
        return inQueue.last ?? outQueue.first
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
let N = Int(readLine()!)!
for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
        .map { String($0) }
    let instruction = QueueInstruction(rawValue: input[0])!
    var element: Int? = nil
    if instruction == .push {
        element = Int(input[1])
    }
    
    queue.execute(instruction: instruction, element: element)
}

