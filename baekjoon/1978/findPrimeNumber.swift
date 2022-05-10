//소수 찾기: https://www.acmicpc.net/problem/1978/ 반복문을 활용한 소수 찾기

import Foundation

private func findPrimeNumber(numbers: [Int]) {
    
    var countOfPrimeNumber = 0
    
    for number in numbers {
        if isPrime(number: number) {
            countOfPrimeNumber += 1
        }
    }
    
    print(countOfPrimeNumber)
}

private func isPrime(number: Int) -> Bool {
    
    if number == 2 { return true }
    guard number > 2 else { return false }
    
    let range = 2..<number
    for comparison in range {
        if number % comparison == 0 { return false }
    }
    return true
}

let _ = readLine()!
let numbers = readLine()!.split(separator: " ")
    .map { Int($0)! }
findPrimeNumber(numbers: numbers)

