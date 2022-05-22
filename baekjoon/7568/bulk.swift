//덩치: https://www.acmicpc.net/problem/7568 연산자 오버로딩을 통해 구조체 비교 연산을 간편하게 하여 순위를 구함

import Foundation

struct Bulk {
    let weight: Int
    let height: Int
    
    static func >(lhs: Bulk, rhs: Bulk) -> Bool {
        return lhs.weight > rhs.weight && lhs.height > rhs.height
    }
    
    static func <(lhs: Bulk, rhs: Bulk) -> Bool {
        return lhs.weight < rhs.weight && lhs.height < rhs.height
    }
}

let iteration = Int(readLine()!)!

var people: [Bulk] = []

for _ in 0..<iteration {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let (weight, height) = (input[0], input[1])
    let bulk = Bulk(weight: weight, height: height)
    people.append(bulk)
}

for i in 0..<people.count {
    let person = people[i]
    var rank = 1
    for j in 0..<people.count {
        if people[j] > person {
            rank += 1
        }
    }
    print(rank)
}


