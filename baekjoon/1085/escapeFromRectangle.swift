//직사각형에서 탈출: https://www.acmicpc.net/problem/1085/ struct와 enum 활용하여 해결함

import Foundation

struct Position {
    let x: Int
    let y: Int
}

struct Rectangle {
    
    let bottomLeft = Position(x: 0, y: 0)
    let width, height: Int
    
    func getMinDistance(pos: Position) -> Int {
        
        var minDistance = getDistance(pos: pos, direction: .left)
        minDistance = min(minDistance, getDistance(pos: pos, direction: .right))
        minDistance = min(minDistance, getDistance(pos: pos, direction: .up))
        minDistance = min(minDistance, getDistance(pos: pos, direction: .down))
        return minDistance
    }
    
    func getDistance(pos: Position, direction: Direction) -> Int {
        
        switch direction {
        case .left:
            return pos.x - bottomLeft.x
        case .right:
            return (bottomLeft.x + width) - pos.x
        case .up:
            return (bottomLeft.y + height) - pos.y
        case .down:
            return pos.y - bottomLeft.y
        }
    }
}

enum Direction: CaseIterable {
    case left, right
    case up, down
}

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let userPos = Position(x: input[0], y: input[1])
let rectangle = Rectangle(width: input[2], height: input[3])

print(rectangle.getMinDistance(pos: userPos))

