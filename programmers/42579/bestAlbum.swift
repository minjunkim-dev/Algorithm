//베스트앨범: https://programmers.co.kr/learn/courses/30/lessons/42579/ 딕셔너리와 고차함수를 활용한 풀이

import Foundation

/* Test Cases */
let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var dictionary: [String: [(Int, Int)]] = [:] // [genre: [(id, play)]
    
    genres.enumerated().map {
        let (id, genre) = $0
        let play = plays[$0.offset]
        dictionary[genre, default: []] += [(id, play)]
    }
    
//    print(dictionary)
    
    return dictionary.values.sorted {
        $0.reduce(0) { $0 + $1.1 } > $1.reduce(0) { $0 + $1.1 }
        }.map { $0.sorted { $0.1 > $1.1 } }
        .flatMap{ $0.prefix(2) }
        .map { $0.0 }
}

//print(solution(genres, plays))

