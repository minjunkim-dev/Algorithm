//소수 구하기: https://www.acmicpc.net/problem/1929/ 에라토스테네스의 체를 활용해야 시간초과가 안남

import Foundation

private func printPrimeNumberInRange(range: ClosedRange<Int>) {
    
    let lowerBound = range.lowerBound
    let upperBound = range.upperBound
    if upperBound < 2 { return }
    
    var primeArray = Array(repeating: true, count: upperBound + 1) // 시작은 일단 모든 숫자가 소수라고 가정
    primeArray[0] = false // 사용하지 않음
    primeArray[1] = false // 숫자 1은 소수가 아님
    
    var i = 2 // 숫자 2부터 검사 시작
    while i * i <= upperBound {
        
        if primeArray[i] {
//            var j = i * 2
            var j = i * i // i * i 미만의 i의 배수는 이미 검사되었으므로
            while j <= upperBound {
                /* i가 소수이므로 i의 배수는 소수가 아님 */
                primeArray[j] = false
                j += i
            }
        }
        /*
         else {}
         i가 소수가 아니면 i의 배수들은 이미 소수가 아닌 것으로 판정되었을 것이므로 다시 검사할 필요X
         */
        
        i += 1
    }
    
    primeArray.enumerated()
        .filter { $0.element && $0.offset >= lowerBound }
        .forEach {
            print($0.offset)
        }
}

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let range = input[0]...input[1]

printPrimeNumberInRange(range: range)

