//유기농 배추: https://www.acmicpc.net/problem/1012 큐를 활용한 bfs로 그래프 내의 연결요소의 개수를 구함

import Foundation

struct Queue<T: Equatable> {
    private var inQueue: [T]
    private var outQueue: [T]
    
    init() {
        inQueue = []
        outQueue = []
    }
    
    var isEmpty: Bool {
        return inQueue.isEmpty && outQueue.isEmpty
    }
    
    var size: Int {
        return inQueue.count + outQueue.count
    }
    
    var elements: [T] {
        return outQueue.reversed() + inQueue
    }
    
    mutating func enqueue(element: [T]) {
        inQueue += element
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue = []
        }
        
        return outQueue.removeLast()
    }
    
    func contains(element: T) -> Bool {
        return inQueue.contains(element) || outQueue.contains(element)
    }
}

enum State: Int {
    case notApplicable = 0
    case toVisit
    case visited
}

enum Direction: CaseIterable {
    case left, right
    case up, down
    
    func move(position: Position) -> Position? {
        let (row, col, rangeRow, rangeCol) = (position.row , position.col, position.rangeRow, position.rangeCol)
        switch self {
        case .left:
            let toMove = Position(row: row, col: col - 1, rangeRow: rangeRow, rangeCol: rangeCol)
            return toMove.isValid ? toMove : nil
        case .right:
            let toMove = Position(row: row, col: col + 1, rangeRow: rangeRow, rangeCol: rangeCol)
            return toMove.isValid ? toMove : nil
        case .up:
            let toMove = Position(row: row - 1, col: col, rangeRow: rangeRow, rangeCol: rangeCol)
            return toMove.isValid ? toMove : nil
        case .down:
            let toMove = Position(row: row + 1, col: col, rangeRow: rangeRow, rangeCol: rangeCol)
            return toMove.isValid ? toMove : nil
        }
    }
}

struct Position: Equatable {
    let row, col: Int
    let rangeRow: ClosedRange<Int>
    let rangeCol: ClosedRange<Int>
    
    var isValid: Bool {
        return rangeRow.contains(row) && rangeCol.contains(col)
    }
}

func bfs(ground: [[State]], start: Position) -> [[State]] {
    var graph = ground
    var visitedQueue: Queue<Position> = Queue()
    var toVisitQueue: Queue<Position> = Queue()
    toVisitQueue.enqueue(element: [start])
    
    while !toVisitQueue.isEmpty {
        if let pos = toVisitQueue.dequeue() {
            if visitedQueue.contains(element: pos) { continue }
            
            graph[pos.row][pos.col] = .visited
            visitedQueue.enqueue(element: [pos])
            Direction.allCases.forEach {
                if let toMove = $0.move(position: pos),
                   graph[toMove.row][toMove.col] == .toVisit {
                    toVisitQueue.enqueue(element: [toMove])
                }
            }
        }
    }
    
    return graph
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!
        .split(separator: " ")
        .map{ Int($0)! }
    let (M, N, K) = (input[0], input[1], input[2])
    
    var ground: [[State]] = Array(
        repeating: Array(repeating: .notApplicable, count: N),
        count: M
    )
    for _ in 0..<K {
        let input = readLine()!
            .split(separator: " ")
            .map { Int($0)! }
        let (i, j) = (input[0], input[1])
        ground[i][j] = .toVisit
    }
    
    var count = 0
    let rangeRow = 0...(M - 1)
    let rangeCol = 0...(N - 1)
    
    // bfs를 통해 그래프 내의 연결요소의 개수를 구함
    for i in 0..<M {
        for j in 0..<N {
            if ground[i][j] == .toVisit {
                let pos = Position(row: i, col: j, rangeRow: rangeRow, rangeCol: rangeCol)
                ground = bfs(ground: ground, start: pos)
                count += 1
            }
        }
    }
    print(count)
}



