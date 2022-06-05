//체스판 다시 칠하기: https://www.acmicpc.net/problem/1018 완전 탐색을 통해 다시 칠해야 하는 정사각형의 최소 개수를 구함

import Foundation

enum ChessColor: String {
    case W
    case B
}

func countForChangingChessColor(board: [[Character]], startRow: Int, startCol: Int, startColor: ChessColor) -> Int {
 
    var count = 0
    var expectedColor = startColor
    
    for i in startRow..<(startRow + 8) {
        for j in startCol..<(startCol + 8) {
            let currentColor = ChessColor(rawValue: String(board[i][j]))
            if currentColor != expectedColor {
                count += 1
            }
            if j < (startCol + 8 - 1) {
                expectedColor = expectedColor == .W ? .B : .W
            }
        }
    }
    
    return count
}

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (row, col) = (input[0], input[1])

var board: [[Character]] = []
for _ in 0..<row {
    let input = Array(readLine()!)
    board.append(input)
}

var minCount = (8 * 8) / 2 // 문제 가정상 다시 칠해야하는 정사각형의 최대 개수
for i in 0...(row - 8) {
    for j in 0...(col - 8) {
        let count1 = countForChangingChessColor(board: board, startRow: i, startCol: j, startColor: .W)
        let count2 = countForChangingChessColor(board: board, startRow: i, startCol: j, startColor: .B)
        let count = min(count1, count2)
        minCount = min(minCount, count)
    }
}

print(minCount)


