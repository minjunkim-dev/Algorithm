//Four Squares: https://www.acmicpc.net/problem/17626 동적계획법을 활용하여 최소 개수의 제곱수 합을 구함

import Foundation

let N = Int(readLine()!)!

var minFourSquares = Array(repeating: 4, count: N + 1) // 라그랑주는 1770년에 모든 자연수는 넷 혹은 그 이하의 제곱수의 합으로 표현할 수 있다고 증명하였으므로 4로 초기화
minFourSquares[0] = 0 // index 0은 사용하지 않음
minFourSquares[1] = 1 // 최소 개수의 제곱수의 합은 1^2로 1개임

var number = 2 // 2부터 시작
var lastBaseOfSquare = 1 // number보다 작은 제곱수중 가장 큰 제곱수의 밑을 관리하기 위함
while number <= N {

    if (lastBaseOfSquare + 1) * (lastBaseOfSquare + 1) == number { // 어떤 수가 특정 수의 제곱으로 표현될 수 있다면 어떤 수는 1개의 제곱수로 표현 가능
        minFourSquares[number] = 1
        lastBaseOfSquare += 1
    } else {
        for i in 1...lastBaseOfSquare {
            let toCompare = minFourSquares[i * i] + minFourSquares[number - i * i] // 특정 수의 제곱을 포함한(그래서 1개의 제곱수로만 표현이 가능한) 제곱수의 합 표현 형식이 최소 개수에 근접할 것이므로
            minFourSquares[number] = min(minFourSquares[number], toCompare)
        }
    }
    
    number += 1
}

print(minFourSquares[N])

