//수 찾기: https://www.acmicpc.net/problem/1920 이진 탐색을 위해서는 먼저 정렬이 필수임을 기억

import Foundation

func binarySearch(numbers: [Int], target: Int) -> Bool {
    
    var start = 0
    var end = numbers.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if target < numbers[mid] {
            end = mid - 1
        } else if target > numbers[mid] {
            start = mid + 1
        } else {
            return true
        }
    }
    
    return false
}

let N = Int(readLine()!)!
var numbers = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
    .sorted(by: <)

let M = Int(readLine()!)!
var targets = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

for target in targets {
    let isExist = binarySearch(numbers: numbers, target: target) ? 1 : 0
    print(isExist)
}

/*
 시간복잡도 계산
 1. 입력받은 배열 일단 정렬: O(NlogN)
 2. M번의 이진탐색: O(MlogN)
 => (N+M)logN
 이는 기존 배열을 정렬하지 않고 전부 순회하면서 찾는 O(MN) 시간복잡도보다 낮음
 */

