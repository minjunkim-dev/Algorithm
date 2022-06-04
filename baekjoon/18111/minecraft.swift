//마인크래프트: https://www.acmicpc.net/problem/18111 시간복잡도를 위해 계산시 모든 영역을 모두 찾아가지 않고, 동일한 높이의 영역은 묶어서 딕셔너리로 빠르게 접근하여 같이 처리함

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let (N, M) = (input[0], input[1])
var B = input[2]

var groundHeights: [[Int]] = []
var minHeight = 256
var maxHeight = 0
for _ in 0..<N {
    let heights = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
    groundHeights.append(heights)
    minHeight = min(minHeight, heights.min()!)
    maxHeight = max(maxHeight, heights.max()!)
}

var heights: Dictionary<Int, Int> = [:] // [height: count]
for i in 0..<N {
    for j in 0..<M {
        let height = groundHeights[i][j]
        heights[height, default: 0] += 1 // 동일한 높이의 영역 개수를 딕셔너리에 저장
    }
}

var targetElapsedTime = 2 * maxHeight * N * M + 1 // 제약 조건에 의해 최대로 걸릴 수 있는 시간 + 1(최소 시간을 구할 것임)
var targetHeight = minHeight - 1 // 제약 조건에 의해 최소로 가능한 높이 - 1(최소 시간이 여러개이면 높이가 가장 높은 것을 구할 것임)
let searchRange = ArraySlice(minHeight...maxHeight) // available height range
for baseHeight in searchRange {

    var requiredBlocks = 0
    var elapsedTime = 0
    for item in heights { // 동일한 높이의 영역을 묶어서 한꺼번에 계산하여 시간복잡도를 낮춤(딕셔너리의 탐색은 O(1))
        let height = item.key
        let count = item.value // 동일한 높이의 영역 개수

        let blocks = baseHeight - height // 한 영역에 제거할, 혹은 쌓을 블럭의 개수(양수이면 블럭을 쌓고, 음수이면 블럭을 제거함)
        elapsedTime += (blocks > 0) ? (blocks * 1 * count) : (abs(blocks) * 2 * count)
        requiredBlocks += blocks * count
    }

    if requiredBlocks <= B { // 필요한 블럭 수가 소유 블럭 수보다 적어야 후보로 가능함
        if elapsedTime <= targetElapsedTime, baseHeight > targetHeight { // 최소 시간을 구하되, 후보가 여러개라면 가장 높은 높이를 solution으로
            targetElapsedTime = elapsedTime
            targetHeight = baseHeight
        }
    }
}

print(targetElapsedTime, targetHeight)
