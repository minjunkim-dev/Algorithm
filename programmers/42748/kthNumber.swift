//k번째 수: https://programmers.co.kr/learn/courses/30/lessons/42748/ 고차함수를 활용한 풀이(모두 0만 있는 케이스를 주의!)

import Foundation

/* Test Cases */
//let numbers = [6, 10, 2]
//let numbers = [3, 30, 34, 5, 9]
//let numbers = [0, 0]

func solution(_ numbers:[Int]) -> String {
    
    let input = numbers.map{ String($0) }
    let output = input
        .sorted {
            let lhs = $0 + $1
            let rhs = $1 + $0
            return lhs.compare(rhs) == .orderedDescending
        }.reduce("") { $0 + $1 }
    
    return output.first == "0" ? "0" : output
}

//print(solution(numbers))
