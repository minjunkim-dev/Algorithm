//단어 정렬: https://www.acmicpc.net/problem/1181/ 정렬 조건이 여러개라면, 우선순위가 낮은 조건으로 먼저 정렬해나가야 정렬이 안정적임

import Foundation

let iteration = Int(readLine()!)!

var words: [String] = []

for _ in 0..<iteration {
    let input = readLine()!
    words.append(input)
}

let sortedResult = Set(words)
    .sorted {
        $0.caseInsensitiveCompare($1) == .orderedAscending
    }
    .sorted {
        $0.count < $1.count
    }

sortedResult.forEach {
    print($0)
}


