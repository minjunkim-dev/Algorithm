//숫자 정렬하기 2: https://www.acmicpc.net/problem/2751/ swift의 기본함수로 숫자 정렬

import Foundation

let iteration = Int(readLine()!)!

let range = 0..<iteration
var list: [Int] = []
for _ in range {
    let element = Int(readLine()!)!
    list.append(element)
}

list.sorted {
    $0 < $1
}.forEach {
    print($0)
}


