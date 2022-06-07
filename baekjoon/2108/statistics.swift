//통계학: https://www.acmicpc.net/problem/2108 클로저를 활용하여 입력에 대한 통계치를 출력함

import Foundation

let N = Int(readLine()!)!

var numbers: [Int] = []
for _ in 0..<N {
    let element = Int(readLine()!)!
    numbers.append(element)
}

// 산술평균
let arithmeticMean = { (numbers: [Int]) -> Int in
    let sum = numbers.reduce(0, +)
    return Int(round(Double(sum) / Double(numbers.count)))
}

// 중앙값
let median = { (arrangedNumbers: [Int]) -> Int in
    let sorted = numbers.sorted(by: <)
    return sorted[sorted.count / 2]
}

// 최빈값
let mode = { (numbers: [Int]) -> Int in
    var dictionary: Dictionary<Int, Int> = [:]
    for number in numbers {
        dictionary[number, default: 0] += 1
    }
    
    let maxValue = dictionary.values.max()
    let ascendModes = dictionary.filter {
        $0.value == maxValue
    }.keys.sorted(by: <)
    
    return ascendModes.count > 1 ? ascendModes[1] : ascendModes[0]
}

// 범위
let range = { (ascendNumbers: [Int]) -> Int in
    return ascendNumbers.last! - ascendNumbers.first!
}

numbers.sort(by: <) // 오름차순을 입력으로 넣어야 제대로 계산되게끔 클로저를 구성하였음
print(arithmeticMean(numbers))
print(median(numbers))
print(mode(numbers))
print(range(numbers))


