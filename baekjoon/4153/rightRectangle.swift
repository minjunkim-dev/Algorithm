//직각삼각형: https://www.acmicpc.net/problem/4153/ 피타고라스의 정리를 활용하여 직각삼각형 여부를 판단함

import Foundation

extension Int {
    
    var squared: Int {
        self * self
    }
}

func isRightRectangle(input: [Int]) -> Bool {

    let sortedInput = input.sorted { $0 > $1 }
    return sortedInput[0].squared == sortedInput[1].squared + sortedInput[2].squared ? true : false
}

var input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

while !(input.contains(0)) {

    let text = isRightRectangle(input: input) ? "right" : "wrong"
    print(text)

    input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
}

