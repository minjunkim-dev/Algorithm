//상금 헌터: https://www.acmicpc.net/problem/15953 각 순위에 해당하는 인원들을 모두 누적한 결과와 실제 순위를 비교하여 얻을 수 있는 상금을 계산함

import Foundation

struct Reward {
    let prizeMoney, personnel: Int
}

let rewardOfFirstFestival = [
    Reward(prizeMoney: 5000000, personnel: 1),
    Reward(prizeMoney: 3000000, personnel: 2),
    Reward(prizeMoney: 2000000, personnel: 3),
    Reward(prizeMoney: 500000, personnel: 4),
    Reward(prizeMoney: 300000, personnel: 5),
    Reward(prizeMoney: 100000, personnel: 6),
]

let rewardOfSecondFestival = [
    Reward(prizeMoney: 5120000, personnel: 1),
    Reward(prizeMoney: 2560000, personnel: 2),
    Reward(prizeMoney: 1280000, personnel: 4),
    Reward(prizeMoney: 640000, personnel: 8),
    Reward(prizeMoney: 320000, personnel: 16),
]

func getMoney(rewards: [Reward], rank: Int) -> Int {
    
    guard rank != 0 else { return 0 } // 0이면 본선 진출 실패를 의미하므로
    
    let accumPersonnels = rewards.map {
        $0.personnel
    }.reduce(into: Array<Int>()) { partialResult, personnel in
        let accum = partialResult.last ?? 0
        partialResult.append(accum + personnel)
    }
    
    for (offset, element) in accumPersonnels.enumerated() {
        if rank <= element {
            return rewards[offset].prizeMoney
        }
    }

    return 0 // 순위가 상금권 밖이면 상금은 0원
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let (alpha, beta) = (input[0], input[1])
    
    var money = getMoney(rewards: rewardOfFirstFestival, rank: alpha)
    money += getMoney(rewards: rewardOfSecondFestival, rank: beta)
    print(money)
}


