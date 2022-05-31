//듣보잡: https://www.acmicpc.net/problem/1764 빠른 검색을 위해 해시를 활용하고 있는 딕셔너리를 사용함

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (N, M) = (input[0], input[1])

var nameDictionary: Dictionary<String, Bool> = [:]

for _ in 0..<N {
    let name = readLine()!
    nameDictionary[name] = true
}

var nameList: [String] = []
for _ in 0..<M {
    let name = readLine()!
    if let _ = nameDictionary[name] { // 듣도 못한 사람의 명단에 보도 못한 사람이 있다면
        nameList.append(name)
    }
}

nameList.sort(by: <)
print(nameList.count)
nameList.forEach {
    print($0)
}

