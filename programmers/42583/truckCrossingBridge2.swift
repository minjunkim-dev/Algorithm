//다리를 지나는 트럭: https://programmers.co.kr/learn/courses/30/lessons/42583/ 클로저를 활용한 풀이

import Foundation

/* Test Cases */
//let bridgeLength = 2
//let weight = 10
//let truckWeights = [7, 4, 5, 6]
//let bridgeLength = 100
//let weight = 100
//let truckWeights = [10]
let bridgeLength = 100
let weight = 100
let truckWeights = Array(repeating: 10, count: 10)

/* 문제에서 설명이 부족한 조건들
 1. 트럭은 1초에 1 length만큼 이동
 2. 대기 트럭은 조건이 만족할 때 "단 1대"만 다리를 건너기 시작함
 */
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var elapsedTime = 0 // 경과시간
    var waitingTruck: [Int] = truck_weights // 다리를 건너려고 기다리고 있는 트럭들
    var truckCrossingBridge: [Int] = [] // 다리를 건너고 있는 트럭들
    var distanceInProgress: [Int] = [] // 다리를 건너고 있는 트럭의 진행거리

    let departure: (Int) -> () = { weight in 
        truckCrossingBridge.append(weight)
        distanceInProgress.append(1)
    } 
    
    let progress: () -> Void  = {
        distanceInProgress = distanceInProgress.map { $0 + 1 }
        elapsedTime += 1
    }
    
    let arrival: () -> Void = {
        guard let length = distanceInProgress.first else { return }
        if length > bridge_length {
            truckCrossingBridge.removeFirst()
            distanceInProgress.removeFirst()
        }
    }
    
    let sumOfWeightOnBridge: () -> Int = { 
        truckCrossingBridge.reduce(0) { $0 + $1 }
    }
    
    /* 다리를 건너고 있는 트럭도 없고, 건너기를 기다리는 트럭도 없다면 종료 */
    while !(truckCrossingBridge.isEmpty && waitingTruck.isEmpty) {
        progress()
        arrival()
        if let first = waitingTruck.first {
            if sumOfWeightOnBridge() + first <= weight {
                departure(waitingTruck.removeFirst())
            }
        }
    } 

    return elapsedTime
}

print(solution(bridgeLength, weight, truckWeights))

