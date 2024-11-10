//
//  NewsArticle.swift
//  NetworkingModule
//
//  Created by Apple on 10.11.24.
//


import Foundation

public struct NewsArticle: Decodable {
    public let title: String
    public let author: String
    public let publishedAt: String
    public let imageUrl: String
    public let description: String
}
