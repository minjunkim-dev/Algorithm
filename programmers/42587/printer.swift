//프린터: https://programmers.co.kr/learn/courses/30/lessons/42587/ 큐를 사용하려다가 그냥 리스트를 큐처럼 사용함

import Foundation

/* Test Cases */
//let priorities = [2, 1, 3, 2]
//let location = 2
let priorities = [1, 1, 9, 1, 1, 1]
let location = 0
//let priorities = [3]
//let location = 0

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var currentPriorities = priorities
    var currentLocation = location
    var order = 0
    
    while !(currentLocation == -1) {
        let priority = currentPriorities.removeFirst()
        let higherPriorities = currentPriorities.filter { $0 > priority }
        
        currentLocation -= 1
        if higherPriorities.isEmpty { // 현재 문서를 출력
            order += 1
        } else { // 현재 문서를 출력하지 않고 큐의 가장 마지막으로 넣기
            currentPriorities.append(priority)
            if currentLocation == -1 { // 내가 인쇄를 요청한 문서를 맨 뒤로 넣어야 하므로 
                currentLocation = currentPriorities.endIndex - 1 
            }
        } 
    }
    
    return order
}

print(solution(priorities, location))

