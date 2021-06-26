import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if self < 0 {return "N/A".inColor(color: .yellow)}
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}