import Foundation

enum Colors: Int {
    case red = 31
    case green = 32
    case yellow = 33
}

extension String {
    func toInt() -> Int {
        let input = self.replacingOccurrences(of: ",", with: "")
        return Int(input) ?? -1
    }
    
    func toDouble() -> Double {
        let input = self.replacingOccurrences(of: ",", with: "")
        return Double(input) ?? -1.0
    }
    
    func inColor(color: Colors) -> String {
        return "\u{1B}[\(color.rawValue)m\(self)\u{1B}[0m"
    }
}