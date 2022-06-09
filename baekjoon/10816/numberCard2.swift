//숫자 카드 2: https://www.acmicpc.net/problem/10816 이분 탐색을 통해 효율적 탐색을 수행함

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

func getMidPoint(pos1: Int, pos2: Int) -> Int {
    let (startPoint, endPoint) = pos1 < pos2 ? (pos1, pos2) : (pos2, pos1)
    return startPoint + (endPoint - startPoint) / 2 // to prevent overflow
}

// key 값 이상인 것중 가장 최소 인덱스를 반환
func lowerBound(array: [Int], key: Int) -> Int {
    
    /* 반열린구간을 활용할 것임 */
    var start = array.startIndex
    var end = array.endIndex
    
    while start < end {
        let mid = getMidPoint(pos1: start, pos2: end) // 순서 바꿔도 상관없음
        if key <= array[mid] {
            end = mid
        } else { // key > array[mid]
            start = mid + 1
        }
    }
    
    return start
}

// key 값 초과인 것중 가장 최소 인덱스를 반환
func upperBound(array: [Int], key: Int) -> Int {
    
    /* 반열린구간을 활용할 것임 */
    var start = array.startIndex
    var end = array.endIndex
    
    while start < end {
        let mid = getMidPoint(pos1: end, pos2: start) // 순서 바꿔도 상관없음
        if key >= array[mid] {
            start = mid + 1
        } else { // key < array[mid]
            end = mid
        }
    }
    
    return start
}

let fileIO = FileIO()
var cardList: [Int] = [] // 상근이가 가진 숫자 카드 리스트
var cardList2: [Int] = [] // 상근이가 몇 개를 가지고 있는지 알아야 할 숫자 카드 리스트

let N = fileIO.readInt()
for _ in 0..<N {
    cardList.append(fileIO.readInt())
}

let M = fileIO.readInt()
for _ in 0..<M {
    cardList2.append(fileIO.readInt())
}

cardList.sort(by: <) // 가진 카드 리스트를 오름차순으로 정렬(이분 범위 탐색 수행을 위함임)
var result = ""
for card in cardList2 {
    let lower = lowerBound(array: cardList, key: card)
    let upper = upperBound(array: cardList, key: card)
    let count = upper - lower // 반열린 구간으로 upper는 개수에 포함하지 않으므로
    result += "\(count) "
}

print(result)


