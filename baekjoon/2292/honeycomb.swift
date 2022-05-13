//벌집: https://www.acmicpc.net/problem/2292/ 규칙을 찾아 예외처리하고 계산함

import Foundation

func getShortestPath(number: UInt) -> UInt {
    
    if number == 1 { return 1 }
    else if number < 8 { return 2 }
    else {
        
        var temp: Int = Int(number) - (1 + 6)
        var iteration: UInt = 2
        var surroundedHexagon: Int = 12
        while temp > 0 {
            temp -= surroundedHexagon
            iteration += 1
            surroundedHexagon += 6
        }
        
        return iteration
    }
}

let input = UInt(readLine()!)!
print(getShortestPath(number: input))


