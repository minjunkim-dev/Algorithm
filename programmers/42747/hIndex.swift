//H-Index: https://programmers.co.kr/learn/courses/30/lessons/42747/ enumerated를 활용한 단순 풀이

import Foundation

/* Test Cases */
//let citations = [3, 0, 6, 1, 5]
//let citations = [0, 0, 0, 0, 0]
//let citations = [0, 1, 1]


func solution(_ citations:[Int]) -> Int {
    
    var hIndex = 0
    for (index, citation) in citations.sorted(by: >).enumerated() {
        if citation >= index + 1  {
            hIndex = index + 1
        } else {
            break
        }
    }
    return hIndex
}

//print(solution(citations))

