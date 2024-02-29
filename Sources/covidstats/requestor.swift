import Foundation

func requestor(target: String) async throws -> String {
    guard let url = URL(string: target) else { fatalError("invalid URL!")}
     let urlRequest = URLRequest(url:url)
     let (data, _) = try await URLSession.shared.data(for: urlRequest)
    return String(data: data, encoding: .utf8)!;
}
