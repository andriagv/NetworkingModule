// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

public class NetworkManager: NetworkProtocol {
    public init() {}
    
    public func fetchNews(completion: @escaping @Sendable ([NewsArticle]) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching news: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let articlesArray = jsonResponse["articles"] as? [[String: Any]] {
                    let articles = articlesArray.compactMap { articleData -> NewsArticle? in
                        let title = articleData["title"] as? String ?? "No Title"
                        let author = articleData["author"] as? String ?? "Unknown"
                        let publishedAt = articleData["publishedAt"] as? String ?? "No Date"
                        let imageUrl = articleData["urlToImage"] as? String ?? ""
                        let description = articleData["description"] as? String ?? "No Description"
                        return NewsArticle(title: title, author: author, publishedAt: publishedAt, imageUrl: imageUrl, description: description)
                    }
                    completion(articles)
                }
            } catch {
                print("JSON parsing error: \(error)")
            }
        }.resume()
    }
}


private let apiKey = "2e41c513815843378fa95bace03e6dff"
private let baseURL = "https://newsapi.org/v2/everything?q=bitcoin"



