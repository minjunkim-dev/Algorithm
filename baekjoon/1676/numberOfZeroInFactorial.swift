//팩토리얼 0의 개수: https://www.acmicpc.net/problem/1676 팩토리얼 수를 직접 얻고 여기서 0의 수를 세는 것은 숫자가 너무 커지기 때문에 이를 지양하고, 팩토리얼의 정의에서 0의 개수를 쉽게 구할 수 있는 아이디어를 활용함

import Foundation

extension Int {
    
    /*
     (2, 5) 페어의 개수가 곧 0의 개수임(2 * 5 = 10이므로)
     
     2의 배수보다는 5의 배수가 적으므로,
     5의 배수의 개수가 곧 (2, 5) 페어의 개수임
     */
    var numberOfZerosInFactorial: Int {
        
        guard 0 <= self, self <= 500 else { return -1 } // 문제에서 N은 0 <= N <= 500
        
        let numberOf5 = self / 5
        let numberOf25 = self / (5 * 5) // 25의 배수는 5의 배수이면서, 5를 2개 포함하고 있으므로 여기서 한번 더 세어줌
        let numberOf125 = self / (5 * 5 * 5) // 125의 배수는 5의 배수이면서, 25의 배수이면서, 5를 3개 포함하고 있으므로 여기서 한번 더 세어줌
        
        return numberOf5 + numberOf25 + numberOf125
    }
}

let N = Int(readLine()!)!
print(N.numberOfZerosInFactorial)


