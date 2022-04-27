//수 정렬하기 3: https://www.acmicpc.net/problem/10989 시간 제한 통과를 위해 계수 정렬 및 빠른 입출력을 활용함

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()
let iteration = file.readInt()

var numbers: [Int] = []
var maxNumber = 0
for _ in 0..<iteration {
    let input = file.readInt()
    numbers.append(input)
    maxNumber = max(maxNumber, input)
}

var countingArray = Array(repeating: 0, count: maxNumber + 1)
var sortedNumbers = Array(repeating: 0, count: numbers.count)

for number in numbers {
    countingArray[number] += 1
}


let _ = countingArray // for stable sort
    .enumerated()
    .reduce(0) {
        countingArray[$1.offset] = $0 + $1.element
        return $0 + $1.element
    }

for number in numbers.reversed() { // for stable sort
    let index = countingArray[number] - 1
    sortedNumbers[index] = number
    countingArray[number] -= 1
}

var result = ""
sortedNumbers
    .forEach {
        result += String($0) + "\n"
    }
print(result)

/*
 swift에서 제공하는 sort() 말고 O(n + k)의 계수 정렬을 사용해도 아마 시간이 초과될 것이다.
 아래 링크를 참고하여 빠른 입출력까지 하면 시간 초과를 피할 수 있다.
 https://www.acmicpc.net/board/view/69241
 */

