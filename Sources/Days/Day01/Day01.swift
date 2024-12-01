func getNumbers(input: [String]) -> ([Int], [Int]) {
  var leftNumbers: [Int] = []
  var rightNumbers: [Int] = []

  for line in input {
    let splitted = line.split(separator: " ")
    if splitted.count != 2 {
      print("Invalid input: \(line)")
      continue
    }
    leftNumbers.append(Int(splitted[0])!)
    rightNumbers.append(Int(splitted[1])!)
  }

  return (leftNumbers, rightNumbers)
}

func day01Part1() -> String {
  var (leftNumbers, rightNumbers) = getNumbers(input: getInput(day: 1, part: Part.one))

  leftNumbers.sort()
  rightNumbers.sort()
  let result = zip(leftNumbers, rightNumbers)
    .map { abs($0.0 - $0.1) }
    .reduce(0, +)

  return String(result)
}

func day01Part2() -> String {
  let (leftNumbers, rightNumbers) = getNumbers(input: getInput(day: 1, part: Part.two))

  let result = leftNumbers.map { leftNumber in
    let matches = rightNumbers.count { rightNumber in
      leftNumber == rightNumber
    }
    return leftNumber * matches
  }.reduce(0, +)

  return String(result)
}
