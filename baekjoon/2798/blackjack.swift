//블랙잭: https://www.acmicpc.net/problem/2798/ 중첩 반복문을 통하여 모든 조합을 검색하여 최적의 답을 찾음

import Foundation

var input = readLine()!.split(separator: " ")
let countOfCard = Int(input.first!)!
let blackjack = Int(input.last!)!

let numbersOfCard = readLine()!.split(separator: " ")
    .map { Int($0)! }

getSumOfCards(numbersOfCard: numbersOfCard, blackjack: blackjack)

func getSumOfCards(numbersOfCard: [Int], blackjack: Int) {
    
    let firstRange = 2..<numbersOfCard.count
    
    var result = 0
    for i in firstRange.reversed() {
        let first = numbersOfCard[i]
        
        let secondRange = 1..<i
        for j in secondRange.reversed() {
            let second = numbersOfCard[j]
            
            let thirdRange = 0..<j
            for k in thirdRange.reversed() {
                let third = numbersOfCard[k]
                
                let sum = first + second + third
                if sum <= blackjack, sum > result {
                    result = sum
                }
            }
        }
    }
    
    print(result)
}

