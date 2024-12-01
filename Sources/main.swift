let days = [
    1: Day01.self
]

func parseArguments() -> (Int, Part)? {
    let arguments = CommandLine.arguments
    guard arguments.count == 3,
        let day = Int(arguments[1]),
        let part = Int(arguments[2]), part == 1 || part == 2
    else {
        return nil
    }
    return (day, Part(rawValue: part)!)
}

func run(day: Int, part: Part) -> String? {
    guard let dayType = days[day] else {
        return nil
    }

    let input = getInput(day: day, part: part)
    if part == .one {
        return dayType.part1(input: input)
    }
    return dayType.part2(input: input)

}

func main() {
    guard let (day, part) = parseArguments() else {
        print("Usage: AOC2024 <day> <part (1 | 2)>")
        return
    }

    let res = run(day: day, part: part)
    if let res = res {
        print(res)
    } else {
        print("Could not run day \(day) part \(part)")
    }
}

main()
