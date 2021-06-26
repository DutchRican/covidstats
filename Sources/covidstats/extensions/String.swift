import Foundation

extension String {
    func toInt() -> Int {
        let input = self.replacingOccurrences(of: ",", with: "")
        return Int(input) ?? -1
    }
    
    func toDouble() -> Double {
        let input = self.replacingOccurrences(of: ",", with: "")
        return Double(input) ?? -1.0
    }
}