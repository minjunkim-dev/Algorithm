//부녀회장이 될테야: https://www.acmicpc.net/problem/2775/ 배열 내에서의 부분합을 통하여 해결함

import Foundation

func getNumberOfResidents(floor: Int, roomNumber: Int) -> Int {
    
    var residents = Array(repeating: 0, count: roomNumber)
    residents = residents.enumerated()
        .map {
            $0.offset + 1
        }
    
    for i in 0..<floor {
        residents = getPartialSumInArray(array: residents)
    }
    
    return residents.removeLast()
}

func getPartialSumInArray(array: [Int]) -> [Int] {
    
    var partialSumArray = array
    
    partialSumArray
        .enumerated()
        .reduce(0) {
        partialSumArray[$1.offset] = $0 + $1.element
        return $0 + $1.element
    }
    
    return partialSumArray
}

let iteration = Int(readLine()!)!

for _ in 0..<iteration {
    let floor = Int(readLine()!)!
    let roomNumber = Int(readLine()!)!
    
    print(getNumberOfResidents(floor: floor, roomNumber: roomNumber))
}



