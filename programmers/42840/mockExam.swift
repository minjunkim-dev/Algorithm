//모의고사: https://programmers.co.kr/learn/courses/30/lessons/42840/ 딕셔너리와 고차함수를 활용한 풀이

import Foundation

/* Test Cases */
//let answers = [1, 2, 3, 4, 5]
let answers = [1, 3, 2, 4, 2]

func solution(_ answers:[Int]) -> [Int] {
    
    let responses = [
        [1, 2, 3, 4, 5], // % 5
        [2, 1, 2, 3, 2, 4, 2, 5], // % 8
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // % 10
    ]
    
    var scores = [1: 0, 2: 0, 3: 0] // person: score
    
    answers.enumerated().map { index, answer in
        if answer == responses[0][index % responses[0].count] { scores[1, default: 0] += 1 }
        if answer == responses[1][index % responses[1].count] { scores[2, default: 0] += 1 }
        if answer == responses[2][index % responses[2].count] { scores[3, default: 0] += 1 }
    }
    
    return scores.sorted { $0.key < $1.key }
        .filter{ $0.value == scores.values.max()! }
        .map { $0.key }
}

print(solution(answers))

