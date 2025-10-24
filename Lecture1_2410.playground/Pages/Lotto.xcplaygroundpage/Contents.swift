func lottoNumbers(range: ClosedRange<Int>, length: Int) -> [Int]? {
    guard length <= range.count else {
        return nil
    }
    
    let numbers = Array(range).shuffled().prefix(length).sorted()
    
    return Array(numbers)
}

lottoNumbers(range: 1...40, length: 5)

func lottoNumbers2(range: Range<Int>, length: Int) -> Array<Int>? {
    if length < 0 || length > range.count {
        return nil
    }
    
    var numbers = Set<Int>()
    while numbers.count < length {
        numbers.insert(Int.random(in: range))
    }
    return Array(numbers).sorted()
}

lottoNumbers2(range: 1..<40, length: 5)
