//피보나치 함수: https://www.acmicpc.net/problem/1003 피보나치 함수의 정의를 활용하여 동적계획법을 사용함

import Foundation

func fibonacciWithZero(number: Int) -> Int {
    
    guard number >= 0 else { return -1 }
    
    if number == 0 {
        return 1
    } else if number == 1 {
        return 0
    } else {
        var numberOfZero = Array(repeating: 0, count: number + 1)
        numberOfZero[0] = 1
        numberOfZero[1] = 0
        
        for i in 2...number {
            numberOfZero[i] = numberOfZero[i - 1] + numberOfZero[i - 2]
        }
        
        return numberOfZero[number]
    }
}

func fibonacciWithOne(number: Int) -> Int {
    
    guard number >= 0 else { return -1 }

    if number == 0 {
        return 0
    } else if number == 1 {
        return 1
    } else {
        var numberOfOne = Array(repeating: 0, count: number + 1)
        numberOfOne[0] = 0
        numberOfOne[1] = 1
        
        for i in 2...number {
            numberOfOne[i] = numberOfOne[i - 1] + numberOfOne[i - 2]
        }
        
        return numberOfOne[number]
    }
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    let zeros = fibonacciWithZero(number: N)
    let ones = fibonacciWithOne(number: N)
    print(zeros, ones)
}


