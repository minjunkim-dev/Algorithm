//프린터 큐: https://www.acmicpc.net/problem/1966 큐를 활용하되, 문제에서 요구한 중요도와 관련된 2가지조건을 고려하여 문제를 해결함

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
}

struct Document {
    let id: Int
    let priority: Int
}

let iteration = Int(readLine()!)!

var priorityQueue = Queue<Document>()
for _ in 0..<iteration {
    let input = readLine()!
        .split(separator: " ")
    
    let (count, id) = (Int(input[0]), Int(input[1]))
    var priorities = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    for (index, priority) in priorities.enumerated() {
        let document = Document(id: index, priority: priority)
        priorityQueue.push(element: document)
    }
    
    priorities.sort(by: <)
    
    var order = 1 // 문서가 몇 번째로 인쇄되는지 확인하기 위한 변수
    while !priorityQueue.isEmpty() {
        if let element = priorityQueue.pop() {
            if element.priority == priorities.last { // 현재 큐 내의 최고 우선순위와 동일하고
                if element.id == id { // 아이디가 동일하면
                    print(order) // 몇 번째로 인쇄되었는지 궁금한 문서이므로 출력
                }
                priorities.removeLast()
                order += 1
            } else {
                priorityQueue.push(element: element) // 우선순위가 낮으므로 출력하지 않고 다시 큐에 psuh
            }
        }
    }
}


