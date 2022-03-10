//위장: https://programmers.co.kr/learn/courses/30/lessons/42578/ 딕셔너리와 고차함수를 활용한 풀이

import Foundation

/* Test Cases */
let clothes = [
    ["yellowhat", "headgear"], 
    ["bluesunglasses", "eyewear"], 
    ["green_turban", "headgear"]
]
//let clothes = [
//    ["crowmask", "face"],
//    ["bluesunglasses", "face"],
//    ["smoky_makeup", "face"]
//]


func solution(_ clothes:[[String]]) -> Int {
    
    var clothesDictionary: [String: [String]] = [:]
    
    clothes.map { 
        let name = $0.first!
        let type = $0.last!
//        print(name, type)
        
        let names = clothesDictionary[type] ?? []
        clothesDictionary[type] = names + [name]
    }
    
//    print(clothesDictionary)
    let cases = clothesDictionary.values.reduce(1) { partialResult, names in
        return partialResult * (names.count + 1) // 각 의상 종류마다 미착용을 포함하기 위해 + 1
    }
    
    return cases - 1 // 모두 미착용하는 경우는 제외하기 위해 -1
}

//print(solution(clothes))

