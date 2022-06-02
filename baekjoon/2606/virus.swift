//바이러스: https://www.acmicpc.net/problem/2606 큐와 bfs를 통해 시작노드와 연결된 모든 노드를 찾음

import Foundation

struct Queue<T: Equatable> {
    private var inQueue = [T]()
    private var outQueue = [T]()
    
    var isEmpty: Bool {
        return inQueue.isEmpty && outQueue.isEmpty
    }
    
    var size: Int {
        return inQueue.count + outQueue.count
    }
    
    mutating func enqueue(element: T) {
        inQueue.append(element)
    }
    
    mutating func dequeue() -> T? {
            
        guard !self.isEmpty else { return nil }
        
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
        
        return outQueue.removeLast()
    }
    
    func contains(element: T) -> Bool {
        return inQueue.contains(element) || outQueue.contains(element)
    }
}

let M = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: M + 1) // index 0은 사용안함

let N = Int(readLine()!)!
for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let (node1, node2) = (input[0], input[1])
    /*
    무방향 그래프이므로
    양쪽으로 추가함 
    */
    graph[node1].append(node2)
    graph[node2].append(node1)
}

func bfs(graph: [[Int]], start: Int) -> Queue<Int> {
    var visitedQueue = Queue<Int>()
    var toVisitQueue = Queue<Int>()
    
    toVisitQueue.enqueue(element: start)
    while !toVisitQueue.isEmpty {
        let node = toVisitQueue.dequeue()!
        if visitedQueue.contains(element: node) {
            continue
        }
        
        visitedQueue.enqueue(element: node)
        graph[node].forEach {
            toVisitQueue.enqueue(element: $0)
        }
    }
    
    return visitedQueue
}

let result = bfs(graph: graph, start: 1)
print(result.size - 1)

