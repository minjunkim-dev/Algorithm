//집합: https://www.acmicpc.net/problem/11723 메모리가 극히 제한적인 상황이므로 비트 연산으로 집합을 구현함

import Foundation

final class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

enum SetInstruction: Int {
    
    /* 미리 바이트 총합을 구해놓음 */
    case add = 297
    case remove = 654
    case check = 510
    case toggle = 642
    case all = 313
    case empty = 559
}

let fileIO = FileIO()

let M = fileIO.readInt()

var set: Int = 0
var result = ""
for _ in 0..<M {
    let instruction = SetInstruction(rawValue: fileIO.readStirngSum())!
    switch instruction {
    case .add:
        let element = fileIO.readInt()
        let bitMask = 1 << (element - 1)
        set |= bitMask
    case .remove:
        let element = fileIO.readInt()
        let bitMask = 1 << (element - 1)
        (set &= ~bitMask)
    case .check:
        let element = fileIO.readInt()
        let bitMask = 1 << (element - 1)
        set & bitMask != 0 ? (result += "1\n") : (result += "0\n")
    case .toggle:
        let element = fileIO.readInt()
        let bitMask = 1 << (element - 1)
        set & bitMask != 0 ? (set &= ~bitMask) : (set |= bitMask)
    case .all:
        let bitMask = 0 << 19
        set = ~bitMask
    case .empty:
        set = 0
    }
}

print(result)
