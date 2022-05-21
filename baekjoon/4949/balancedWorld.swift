//균형잡힌 세상: https://www.acmicpc.net/problem/4949 스택을 활용하여 괄호의 균형을 확인함

import Foundation

enum Bracket: String {
    case leftSquare = "["
    case rightSquare = "]"
    case leftCurly = "{"
    case rightCurly = "}"
    case leftRound = "("
    case rightRound = ")"
    case nonApplicable
}

extension String {
    
    var isBalancedBracket: Bool {
        
        var stack = Stack<Bracket>()
        for character in self {
            
            let string = String(character)
            let bracket = Bracket(rawValue: string) ?? .nonApplicable
            switch bracket {
            case .leftSquare, .leftCurly, .leftRound:
                stack.push(element: bracket)
            case .rightSquare, .rightCurly, .rightRound:
                if let pop = stack.pop() {
                    switch pop {
                    case .leftSquare, .leftCurly, .leftRound:
                        if !((bracket == .rightSquare && pop == .leftSquare) ||
                             (bracket == .rightCurly && pop == .leftCurly) ||
                             (bracket == .rightRound && pop == .leftRound)) {
                            return false
                        }
                    case .rightSquare, .rightCurly, .rightRound:
                        return false
                    case .nonApplicable:
                        return false
                    }
                } else {
                    return false
                }
            case .nonApplicable:
                break
            }
        }
        
        return stack.isEmpty()
    }
}

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
    
    mutating func pop() -> T? {
        
        guard !(stack.isEmpty) else { return nil }
        
        return stack.removeLast()
    }
}

var sentences: [String] = []

while true {
    let input = readLine()!
    if input == "." {
        break
    }
    sentences.append(input)
}

for sentence in sentences {
    let text = sentence.isBalancedBracket ? "yes" : "no"
    print(text)
}
