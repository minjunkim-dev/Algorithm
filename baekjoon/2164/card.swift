//카드2: https://www.acmicpc.net/problem/2164 효율적 큐를 구현하기 위해 DoubleStack 형태의 큐를 구현하여 활용함(reversed() 메서드가 O(1)임을 활용)

import Foundation

struct Queue<T> {
    
    private var inQueue: [T] = []
    private var outQueue: [T] = []
    
    func isEmpty() -> Bool {
        return inQueue.isEmpty && outQueue.isEmpty
    }
    
    func count() -> Int {
        return inQueue.count + outQueue.count
    }
    
    mutating func enqueue(element: T) {
        inQueue.append(element)
    }
    
    mutating func dequeue() -> T {
        
        if outQueue.isEmpty {
            outQueue = inQueue.reversed() // O(1)
            inQueue.removeAll()
        }
        
        return outQueue.removeLast()
    }
}

let input = Int(readLine()!)!

var queue = Queue<Int>()
let range = 1...input
for i in range {
    queue.enqueue(element: i)
}

while queue.count() > 1 {
    let _ = queue.dequeue()
    queue.enqueue(element: queue.dequeue())
}

print(queue.dequeue())


