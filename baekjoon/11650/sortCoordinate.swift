//좌표 정렬하기: https://www.acmicpc.net/problem/11650 정렬 기준이 여러개라면 우선순위가 낮은 정렬 기준으로 순서대로 정렬하면 됨

import Foundation

struct Coordinate {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func printCoordinate() {
        print(self.x, self.y)
    }
}

let iteration = Int(readLine()!)!
var coordinates: [Coordinate] = []

for _ in 0..<iteration {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let (x, y) = (input[0], input[1])
    let pos = Coordinate(x: x, y: y)
    coordinates.append(pos)
}

coordinates.sorted {
    $0.y < $1.y
}.sorted {
    $0.x < $1.x
}.forEach {
    $0.printCoordinate()
}

