//회의실 배정: https://www.acmicpc.net/problem/1931 그리디 알고리즘과 정렬을 활용함

import Foundation

struct Meeting {
    let start, end: Int
}

let N = Int(readLine()!)!
var meetings: [Meeting] = []
var counts: [Int] = []
for _ in 0..<N {
    let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
    let (start, end) = (input[0], input[1])
    let meeting = Meeting(start: start, end: end)
    meetings.append(meeting)
}

/* 최대한 많은 회의를 위한 정렬 우선순위
1. 종료 시간이 빠른 미팅
2. 시작 시간이 빠른 미팅
*/
meetings.sort {
    $0.start < $1.start
}

meetings.sort {
    $0.end < $1.end
}

var lastEndTime = 0 // 가창 최근에 회의가 끝난 시간
var count = 0
for meeting in meetings {
    if meeting.start >= lastEndTime { // 이 조건을 만족시켜야 새로운 회의가 열릴 수 있으므로
        lastEndTime = meeting.end
        count += 1
    }
}

print(count)

