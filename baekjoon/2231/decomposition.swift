//분해합: https://www.acmicpc.net/problem/2231/ 최대한 검색 범위를 좁혀 모두 검색하고, 조건을 만족하면 바로 빠져나오게 하여 불필요한 검색을 줄임.

import Foundation

extension Int {
    
    var countDigits: Int {
        
        var temp = self
        var digits = 0
        repeat {
            digits += 1
            temp /= 10
        } while temp > 0
        
        return digits
    }
    
    var getConstructor: Int {
        
        var constructor = 0 // 생성자가 없으면 0
        
        let digits = self.countDigits
        let upperBound = self
        let lowerBound = (self - digits * 9) > 0 ? (self - digits * 9) : 1
        let range = lowerBound...upperBound
    
        for candidate in range {
            
            var sum = candidate
            let array = Array(String(candidate))
                .map { String($0) }
                .map { Int($0)! }
            
            array.forEach {
                sum += $0
            }
            
            if self == sum {
                constructor = candidate
                return constructor
            }
            
        }
        
        return constructor
    }
}

let input = Int(readLine()!)!
print(input.getConstructor)

