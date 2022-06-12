//스택 수열: https://www.acmicpc.net/problem/1874 스택을 활용해 주어진 조건의 문제를 해결함

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    mutating func push(element: T) {
        stack.append(element)
    }
    
    func top() -> T? {
        
        return stack.last
    }
    
    @discardableResult
    mutating func pop() -> T? {
        
        guard !isEmpty() else { return nil }
        
        return stack.removeLast()
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func size() -> Int {
        return stack.count
    }
}

enum StackInstruction: String {
    case push = "+"
    case pop = "-"
}

let input = Int(readLine()!)!

var stack = Stack<Int>()
var stackInstructions: [StackInstruction] = []
var number = 1
for _ in 0..<input {
    let element = Int(readLine()!)!
    
    while number <= element { // 스택에서 뽑았을 때 나와야 할 수까지만 push
        stack.push(element: number)
        stackInstructions.append(.push)
        number += 1 // 스택에 push하는 순서는 반드시 오름차순(문제 조건)
    }
    
    if stack.top() == element {
        stack.pop()
        stackInstructions.append(.pop)
    } else { // 불가능한 경우이므로
        stackInstructions.removeAll()
        break
    }
}

if stackInstructions.isEmpty {
    print("NO")
} else {
    for instruction in stackInstructions {
        print(instruction.rawValue)
    }
}

