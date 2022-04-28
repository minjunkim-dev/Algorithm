//이항 계수 1: https://www.acmicpc.net/problem/11050/ 이항계수 공식을 그대로 적용함

import Foundation

func factorial(n: Int) -> Int {
    
    if n == 0 { return 1 }
    
    let range = 1...n
    
    var result = 1
    for number in range.reversed() {
        result *= number
    }
    return result
}

func getBinomialCoefficient(n: Int, k: Int) -> Int {
    
    if k < 0 || k > n { return 0 }
    
    return factorial(n: n) / (factorial(n: k) * factorial(n: n - k))
}

let input = readLine()!.split(separator: " ")
    .map { Int($0)! }
let (n, k) = (input[0], input[1])
print(getBinomialCoefficient(n: n, k: k))


