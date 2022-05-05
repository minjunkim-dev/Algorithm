//팰린드롬수: https://www.acmicpc.net/problem/1259/ 수의 길이가 짝수건 홀수건 관계없이 양쪽 끝에서부터 차례때로 같은 숫자인지 검사하여 한 번이라도 다르면 팰린드롬수가 아님


import Foundation

func isPalindrome(number: UInt) -> Bool {
    
    let array = Array(String(number))
    let length = array.count
    
    let range = 0..<(length / 2)
    for i in range {
        if array[i] != array[length - 1 - i] {
            return false
        }
    }
    return true
}

var input = UInt(readLine()!)!
while input != 0 {
    let text = isPalindrome(number: input) ? "yes" : "no"
    print(text)
    input = UInt(readLine()!)!
}

