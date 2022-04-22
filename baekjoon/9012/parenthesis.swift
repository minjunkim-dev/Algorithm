//괄호: https://www.acmicpc.net/problem/9012/ 스택을 활용하여 괄호 문자열의 유효성을 확인

//
//  main.swift
//  Algorithm
//
//  Created by beneDev on 2022/04/22.
//

import Foundation

private final class Stack<T>{
    private var stack: [T]
    
    init() {
        self.stack = []
    }
    
    func push(element: T) {
        stack.append(element)
    }
    
    func pop() -> T? {
        return isEmpty() ? nil : stack.removeLast()
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
}

func isValidPS(string: String) -> Bool {
    
    let array = Array(string)
    
    guard string.count % 2 == 0 else { return false }
            
    let range = 0..<string.count
    let stack = Stack<Parenthesis>()
    for i in range {
        let parenthesis = Parenthesis(rawValue: String(array[i]))!
        if parenthesis == .left {
            stack.push(element: parenthesis)
        } else {
            let popedParenthesis = stack.pop()
            if popedParenthesis == nil {
                return false
            }
        }
    }
    
    return stack.isEmpty() ? true : false
}


let iteration = Int(readLine()!)!
for _ in 0..<iteration {
    let input = readLine()!
    let output = isValidPS(string: input) ? "YES" : "NO"
    print(output)
}


enum Parenthesis: String {
    case left = "("
    case right = ")"
}

