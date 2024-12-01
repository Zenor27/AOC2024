import Foundation

enum Part: Int {
  case one = 1
  case two = 2
}

func getInput(day: Int, part: Part) -> [String] {
  let dayString = String(format: "%02d", day)
  let path = "Sources/Days/Day\(dayString)/input\(part.rawValue).txt"

  do {
    let contents = try String(contentsOfFile: path)
    return contents.components(separatedBy: "\n")
  } catch {
    fatalError("Could not read file at \(path)")
  }
}
