//위장: https://programmers.co.kr/learn/courses/30/lessons/42578/ 집합과 고차함수를 활용한 풀이

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
    
    let types = Set(clothes.map { $0.last! })
    let cases = types.map { type in
        return clothes.filter { $0.last! == type }.count + 1 // 각 의상 종류마다 미착용을 포함하기 위해
    }.reduce(1) { $0 * $1 }
    
    return cases - 1 // 모두 미착용하는 경우는 제외하기 위해 -1
}

//print(solution(clothes))

