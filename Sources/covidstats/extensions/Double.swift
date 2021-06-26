import Foundation

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
         if self < 0.0 {return "N/A"}
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}