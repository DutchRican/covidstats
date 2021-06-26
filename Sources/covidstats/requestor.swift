import Foundation

func requestor(target: String, completionHandler: @escaping (String) -> Void) {
    guard let url = URL(string: target) else { fatalError("invalid URL!")}
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in 
        guard let data =  data else {fatalError("No data received")}
        completionHandler(String(data: data, encoding: .utf8)!)
    }
    task.resume()
    
}