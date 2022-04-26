//나이순 정렬: https://www.acmicpc.net/problem/10814/ 딕셔너리를 활용해보려했으나 딕셔너리는 순서가 없으므로 구조체 배열을 활용함

import Foundation

struct User {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let iteration = Int(readLine()!)!

var users: [User] = []

for _ in 0..<iteration {
    let input = readLine()!
        .split(separator: " ")
    
    let name = String(input[1])
    let age = Int(input[0])!
    let user = User(name: name, age: age)
    users.append(user)
}

let sortedResult = users.sorted {
    $0.age < $1.age
}

sortedResult.forEach {
    print($0.age, $0.name)
}



