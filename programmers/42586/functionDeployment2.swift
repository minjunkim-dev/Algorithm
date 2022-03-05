//기능개발: https://programmers.co.kr/learn/courses/30/lessons/42586/ 큐 없이 고차함수 활용한 풀이

import Foundation

/* Test Cases */
//let progresses = [93, 30, 55]
//let speeds = [1, 30, 5]
//let progresses = [95, 90, 99, 99, 80, 99]
//let speeds = [1, 1, 1, 1, 1, 1]    
let progresses = [20, 99, 93, 30, 55, 10]
let speeds = [5, 10, 1, 1, 30, 5]


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    let requiredDay = getRequiredDay(progresses, speeds)
    print("requiredDay: \(requiredDay)\n")
    let result = getFunctionCountPerDeployment(requiredDay)
    print("\nresult: \(result)")
    
    return result
}

/* 각 배포마다 포함되는 기능의 개수를 구함 */
func getFunctionCountPerDeployment(_ requiredDay: [Int]) -> [Int] {
    return requiredDay.reduce(([], 0)) { (result, day) -> ([Int], Int) in
        print("intermediate result: \(result)") // 중간 결과
        print("required day: \(day)") // 기능 완성에 필요한 일수
        var (list, lastMaxDay) = result
        
        guard let lastFunctionCount = list.last else { // 첫번째 작업에 대한 예외처리
            return ([1], day)
        }
        
        if lastMaxDay >= day { // 현재 기능은 이전 기능들이 아직 완료되지 않아 아직 배포되지 않은 기능들과 같이 배포되므로
            list[list.endIndex - 1] += 1
            return (list, lastMaxDay)
        }
        else { // 현재 기능은 새로운 배포에 포함되는 기능이므로
            list.append(1)
            return (list, day)
        }
    }.0  // 최종 결과 튜플에서 첫번째 값이 우리가 원하는 값이므로
}

/* 각 기능별 소요일을 구함 */
func getRequiredDay(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    return zip(progresses, speeds)
        .map{ Int(ceil(Double(100 - $0) / Double($1))) }
}

solution(progresses, speeds)


