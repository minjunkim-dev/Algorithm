//인형들: https://www.acmicpc.net/problem/15954 1)K개 "이상"의 3)"연속된" 위치에 있는 인형들이 대상이라는 것을 명확히 파악하고, 해당하는 모든 후보들에 대해 통계값을 구하여 비교함

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let (N, K) = (input[0], input[1])
let preferPersonnels = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

func getSTD(prefer: ArraySlice<Int>) -> Double {
    let length = prefer.count
    let mean = Double(prefer.reduce(0, +)) / Double(length)
    let variation = prefer
        .map { Double($0) }
        .reduce(0) {
            return $0 + ($1 - mean) * ($1 - mean)
        } / Double(length)
    
    return variation.squareRoot()
}

var minSTD: Double = getSTD(prefer: preferPersonnels[0..<K])
for i in K...N { // k개 이상 연속
    for j in 0..<(N - i + 1) { // 시작점 {
        let std = getSTD(prefer: preferPersonnels[j..<(j + i)])
        if std < minSTD {
            minSTD = std
        }
    }
}

print(String(format: "%0.11f", arguments: [minSTD]))

