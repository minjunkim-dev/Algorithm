//나는야 포켓몬 마스터 이다솜: https://www.acmicpc.net/problem/1621 빠른 검색을 위해 해시를 활용한 딕셔너리를 사용함


import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (N, M) = (input[0], input[1])

var pokemonDictionary: Dictionary<String, Int> = [:] // key => value 빠른 접근을 위함 - O(1)
var pokemonNameList: [String] = [] // value => key 빠른 접근을 위함(이거도 Dictionary로 해도 되긴 할듯)

for number in 1...N {
    let name = readLine()!
    pokemonDictionary[name] = number
    pokemonNameList.append(name)
}

for _ in 0..<M {
    let id = readLine()!
    if let number = Int(id) { // 숫자가 주어지면 포켓몬 이름에 접근
        print(pokemonNameList[number - 1])
    } else { // 이름이 주어지면 key를 통해 value인 포켓몬 번호를 출력
        print(pokemonDictionary[id]!)
    }
}


