//최대공약수와 최고공배수: https://www.acmicpc.net/problem/2609 유클리드 호제법을 활용하여 최대공약수와 최소공배수를 구함

import Foundation

func gcd(m: Int, n: Int) -> Int {
    
    var (dividend, divisor) = m >= n ? (m, n) : (n, m) // dividend > divisor
    var remain = dividend % divisor
    while remain > 0 {
        (dividend, divisor) = divisor >= remain ? (divisor, remain) : (remain, divisor) // dividend > divisor
        remain = dividend % divisor
    }
    
    return divisor
}

func lcm(m: Int, n: Int) -> Int {
    return m * n / gcd(m: m, n: n)
}

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (m, n) = (input[0], input[1])

print(gcd(m: m, n: n))
print(lcm(m: m, n: n))


