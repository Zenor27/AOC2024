func getNumbers(input: [String]) -> ([Int], [Int]) {
  var leftNumbers: [Int] = []
  var rightNumbers: [Int] = []

  for line in input {
    let splitted = line.split(separator: " ")
    guard splitted.count == 2,
      let left = Int(splitted[0]),
      let right = Int(splitted[1])
    else {
      fatalError("Invalid input: \(line)")
    }

    leftNumbers.append(left)
    rightNumbers.append(right)
  }

  return (leftNumbers, rightNumbers)
}

struct Day01: DayProtocol {
  static func part1(input: [String]) -> String {
    let (leftNumbers, rightNumbers) = getNumbers(input: getInput(day: 1, part: Part.one))

    let result = zip(leftNumbers.sorted(), rightNumbers.sorted())
      .map { abs($0 - $1) }
      .reduce(0, +)

    return String(result)
  }

  static func part2(input: [String]) -> String {
    let (leftNumbers, rightNumbers) = getNumbers(input: getInput(day: 1, part: Part.two))

    let result = leftNumbers.map { leftNumber in
      let matches = rightNumbers.count { leftNumber == $0 }
      return leftNumber * matches
    }.reduce(0, +)

    return String(result)
  }
}
