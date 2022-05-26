//1로 만들기: https://www.acmicpc.net/problem/1463 동적계획법을 통해 최적의 최소값을 찾음

let N = Int(readLine()!)!

var numberOfOperation = Array(repeating: 0, count: N + 1) 
numberOfOperation[0] = 0 // index 0은 사용하지 않음
numberOfOperation[1] = 0 // 1은 만드는데 필요한 최소 연산은 0번

var number = 2
while number <= N {
    var minValue = number - 1 // 1을 만드는데 필요한 최대 연산 수
    
    if number % 3 == 0 {
        minValue = min(minValue, numberOfOperation[number / 3] + 1) // (3으로 나누어 떨어지는 수의 최소 연산 수 + 1(나누어 떨어졌으므로 1번 소요))와 현재까지 구한 최소 연산 수를 비교
    }
    if number % 2 == 0 {
        minValue = min(minValue, numberOfOperation[number / 2] + 1) // (2로 나누어 떨어지는 수의 최소 연산수 + 1(나누어 떨어졌으므로 1번 소요))와 현재까지 구한 최소 연산 수를 비교
    }
    minValue = min(minValue, numberOfOperation[number - 1] + 1) // (이전 수의 최소 연산수 + 1(1을 단순히 빼는 연산))와 현재까지 구한 최소 연산 수를 비교
    
    numberOfOperation[number] = minValue
    
    number += 1
}

print(numberOfOperation[N])


