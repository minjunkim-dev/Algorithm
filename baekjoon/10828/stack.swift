//스택: https://www.acmicpc.net/problem/10828/ 스택 직접 구현

import Foundation

private final class Stack<T> {
    
    private var stack: [T]
    
    init() {
        self.stack = []
    }
    
    private func push(element: T) {
        stack.append(element)
    }
    
    private func pop() {
        if let element = stack.popLast() {
            print(element)
        } else {
            print(-1)
        }
    }
    
    private func size() {
        print(stack.count)
    }
    
    private func empty() {
        stack.isEmpty ? print(1) : print(0)
    }
    
    private func top() {
        if let element = stack.last {
            print(element)
        } else {
            print(-1)
        }
    }
    
    func executeInstruction(instruction: StackInstruction, element: T?) {
        
        switch instruction {
        case .push:
            if let element = element {
                push(element: element)
            }
        case .pop:
            pop()
        case .size:
            size()
        case .empty:
            empty()
        case .top:
            top()
        }
    }
}

private func useStack(iteration: Int) {
    
    let range = 1...iteration
    let stack = Stack<Int>()
    
    for _ in range {
        var input = readLine()!.split(separator: " ")
            .map { String($0) }
        
        let instruction = StackInstruction(rawValue: input.removeFirst())!
        var element: Int?
        if let string = input.first {
            element = Int(string)
        }
        stack.executeInstruction(instruction: instruction, element: element)
    }
}

let iteration = Int(readLine()!)!
useStack(iteration: iteration)

enum StackInstruction: String {
    case push
    case pop
    case size
    case empty
    case top
}

