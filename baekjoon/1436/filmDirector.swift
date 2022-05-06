//영화감독 숌: https://www.acmicpc.net/problem/1436 swift의 contains 함수가 느려서 시간이 초과되어 for문으로 직접 구현함

import Foundation

let input = Int(readLine()!)!

var number = 666
var order = 1
let base = Array("666")


while order < input {
    number += 1
    
    let stringNumber = String(number)
//    if stringNumber.contains(base) { // contains 함수가 꽤나 느린듯하다.. 시간초과됨
//        order += 1
//    }
    
    var count = 0
    for character in stringNumber {
        if character == base[count] {
            count += 1
        } else {
            count = 0
        }
        
        if count == base.count {
            order += 1
            break
        }
    }
}

print(number)


