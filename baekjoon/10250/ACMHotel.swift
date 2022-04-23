//ACM 호텔: https://www.acmicpc.net/problem/10250/ 손님은 엘레베이터로 이동하는 거리는 고려하지 않고, 같은 거리일때는 아래층을 선호한다는 것을 고려하여 계산함

import Foundation

func printGuestRoomNumber(height: Int, width: Int, order: Int) {
    
    let distance = order % height == 0 ? order / height : order / height + 1
    let floor = order % height == 0 ? height : order % height

    let floorString = String(format: "%d", floor)
    let distanceString = String(format: "%02d", distance)
    print(floorString + distanceString)
}


let iteration = Int(readLine()!)!

for _ in 0..<iteration {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let (H, W, N) = (input[0], input[1], input[2])
    printGuestRoomNumber(height: H, width: W, order: N)
}

