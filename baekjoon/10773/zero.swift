//제로: https://www.acmicpc.net/problem/10773 스택을 활용하여 되돌리는 기능을 구현

import Foundation

struct Stack<T> {
    
    private var stack: [T] = []
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func count() -> Int {
        return stack.count
    }
    
    mutating func push(element: T) {
        stack.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        
        guard !(stack.isEmpty) else { return nil }
        
        return stack.removeLast()
    }
}

let iteration = Int(readLine()!)!

var stack = Stack<Int>()
for _ in 0..<iteration{
    let input = Int(readLine()!)!
    if input == 0 {
        stack.pop()
    } else {
        stack.push(element: input)
    }
}

var sum = 0
while !stack.isEmpty() {
    if let value = stack.pop() {
        sum += value
    }
}

print(sum)

