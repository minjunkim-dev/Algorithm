//Hashing: https://www.acmicpc.net/problem/15829/ 수식이 명확하지 않은 것 같아서 고생한 문제..


import Foundation

let r: UInt = 31
let M: UInt = 1234567891

extension UInt {
    
    func pow(power: UInt) -> UInt { // r^50, 즉 31^50까지도 계산되도록 고려해야 함
        
        var result: UInt = 1
        for _ in 0..<power {
            result *= self
            result %= M
        }
        return result
    }
}

func hash(string: String) -> UInt {
    
    var result: UInt = 0
    
    Array(string)
        .map {
            UInt(Character(String($0)).asciiValue! - (Character("a").asciiValue! - 1))
        }
    
        .enumerated()
        .forEach {
            let ai = $0.element
            let i = UInt($0.offset)
            result += (ai * r.pow(power: i)) % M
        }
    
    return result % M
}

let length = Int(readLine()!)!
let range = 0..<length

let input = readLine()!
print(hash(string: input))
