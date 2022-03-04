//다리를 지나는 트럭: https://programmers.co.kr/learn/courses/30/lessons/42583/ 

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
    
    var truckOverBridge: [Int] = []
    
    var truckCrossingBridge: [Int] = []
    var remainTime: [Int] = []
    truckCrossingBridge.reserveCapacity(bridge_length)
    remainTime.reserveCapacity(bridge_length)
    
    var waitingTruck: [Int] = truck_weights
    
    var elapsedTime = 0
    
    /* 건너는 트럭도 없고, 기다리는 트럭도 없다면 모든 트럭이 건넌 것이므로 종료 */
    while !(truckCrossingBridge.isEmpty && waitingTruck.isEmpty){
        
        print("=======================================")
        print("경과 시간: \(elapsedTime)")
        print("다리를 지난 트럭: \(truckOverBridge)")
        print("다리를 건너는 트럭: \(truckCrossingBridge)")
        print("다리를 건너는 트럭의 남은 시간: \(remainTime)")
        print("대기 트럭: \(waitingTruck)")
        print("=======================================")
        
        elapsedTime += 1
        
        /* 다리를 다 건넌 트럭을 리스트에서 제거 */
        remainTime = remainTime.map { $0 - 1 }
        for time in remainTime {
            if time > 0 { break } // time이 양수이면 큐이므로 뒤의 time 값들도 모두 양수이기 때문에 탈출
            truckOverBridge.append(truckCrossingBridge.removeFirst())
            remainTime.removeFirst()
        }
        
        /* 순서가 가장 먼저인 대기 트럭 "하나"가 조건을 만족하면 다리를 건너게 함 */
        let currentWeight = truckCrossingBridge.reduce(0) { (result, weight) -> Int in result + weight } // 다리를 건너고 있는 트럭의 총무게합
        if let firstWaitingTruckWeight = waitingTruck.first {
            if (currentWeight + firstWaitingTruckWeight) <= weight { // (현재 다리를 건너고 있는 트럭의 총무게합 + 대기 트럭의 무게)가 무게 최대치 이하이면 해당 대기 트럭은 다리를 건널 수 있음  
                truckCrossingBridge.append(waitingTruck.removeFirst())
                remainTime.append(bridge_length)
            }
        }
        
    } 

    return elapsedTime
}

print(solution(bridgeLength, weight, truckWeights))

