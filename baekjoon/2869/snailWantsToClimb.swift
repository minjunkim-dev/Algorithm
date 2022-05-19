//달팽이는 올라가고 싶다: https://www.acmicpc.net/problem/2869/ 시간 제한 내에 풀기 위해 반복문 사용하지 않고 사칙연산으로 해결함

import Foundation

var input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (risingHeightDuringTheDay, slidedHeightDuringTheNight, targetHeight) = (input[0], input[1], input[2])

let risingHeightPerDay = (risingHeightDuringTheDay - slidedHeightDuringTheNight)

var days = (targetHeight - risingHeightDuringTheDay) / risingHeightPerDay
if (targetHeight - risingHeightDuringTheDay) % risingHeightPerDay != 0 { days += 1 }

days += 1
print(days)


