//
//  NetworkProtocol.swift
//  NetworkingModule
//
//  Created by Apple on 10.11.24.
//

import Foundation

public protocol NetworkProtocol {
    func fetchNews(completion: @escaping @Sendable ([NewsArticle]) -> Void)
}
