//설탕 배달: https://www.acmicpc.net/problem/2839/ 반복문을 활용한 최적 조합 찾기

import Foundation

private func sugarDelivery() -> Void {
    
    guard let input = Int(readLine()!) else { return }
    
    let quotientOf5kg = input / 5
    
    var output = -1
    
    if quotientOf5kg >= 1 {
        
        let range = 1...quotientOf5kg
        for quotient in range.reversed() {
            
            let remain = input - 5 * quotient
            if remain % 3 == 0 {
                output = quotient + remain / 3
                break // 가장 적은 봉지 수를 찾아야하므로 찾으면 바로 반복문은 종료
            }
        }
    }
    
    if output == -1 && input % 3 == 0 { // 5kg 봉지를 사용한 조합에서 아직 답을 못찾은 경우 + 3kg 봉지로만 가능한 경우
        output = input / 3
    }
    
    print(output)
}

sugarDelivery()

