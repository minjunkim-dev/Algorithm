//비밀번호 찾기: https://www.acmicpc.net/problem/17219 효율적인 탐색을 위해 해시를 활용하고 있는 딕셔너리를 사용함

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (N, M) = (input[0], input[1])

var siteDictionary: Dictionary<String, String> = [:]
for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
        .map { String($0) }
    let (site, password) = (input[0], input[1])
    siteDictionary[site] = password
}

for _ in 0..<M {
    let site = readLine()!
    print(siteDictionary[site]!)
}


