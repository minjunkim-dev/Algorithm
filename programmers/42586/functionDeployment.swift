//functionDeployment: https://programmers.co.kr/learn/courses/30/lessons/42586/ 큐를 활용한 풀이(근데 큐가 굳이 필요한가..?)

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    fileprivate var isEmpty: Bool {
        return queue.isEmpty
    }
    
    fileprivate var count: Int {
        return queue.count
    }
    
    fileprivate mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    fileprivate mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

/* Test Cases */
//let progresses = [93, 30, 55]
//let speeds = [1, 30, 5]
//let progresses = [95, 90, 99, 99, 80, 99]
//let speeds = [1, 1, 1, 1, 1, 1]    
let progresses = [20, 99, 93, 30, 55, 10]
let speeds = [5, 10, 1, 1, 30, 5]


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    let completes = makeCompletes(progresses, speeds) // 각 기능 완성에 필요한 작업일수 
    var taskQueue = makeTaskQueue(completes) // 큐 생성
    
    var result: [Int] = []
    
    if var baseComplete = taskQueue.dequeue() { // 비교 기준이 되는 기능 완성에 필요한 작업일수
        
        var minFunctionCount = 1 // 각 배포에서 최소 기능 수
        var functionCount = minFunctionCount 
        
        while !(taskQueue.isEmpty) {
            
            if let currentComplete = taskQueue.dequeue() {
                if baseComplete >= currentComplete { // (기준이 되는 기능에 필요한 작업일수 >= 현재 기능에 필요한 작업일수) 이면, 현재 기능은 기준 기능과 같이 배포됨
                    functionCount += 1
                } else { // 위의 경우가 아니라면, 기준 기능부터 현재 기능까지 같이 배포됨
                    result.append(functionCount)
                    baseComplete = currentComplete
                    functionCount = minFunctionCount // 현재 기능까지 이미 배포되었으므로, 최소 기능 수는 리셋
                }
            } 
        }
        
        result.append(functionCount) // 주의!! 큐가 빈 상태에서 마지막으로 한번 더 같이 배포되는 기능 수를 추가해주어야 함
    }
    
    print("completes: \(completes)")
    print("result: \(result)")
    
    return result
}

func makeTaskQueue(_ completes:[Int]) -> Queue<Int> {
    var queue = Queue<Int>()
    completes.forEach { complete in
        queue.enqueue(complete)
    }
    return queue
}

func makeCompletes(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var completes: [Int] = []
    
    for (i, progress) in progresses.enumerated() {
        let speed = speeds[i]
        
        let complete = Int(ceil(Double(100 - progress) / Double(speed)))
        completes.append(complete)
    }
    
    return completes
}

solution(progresses, speeds)

